import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';
import '../../core/constants/enums.dart';
import 'main_hero_pool_cubit.dart';

class ScoreBreakdown {
  final int laneScore, mainScore, counterScore, total;
  final List<String> counteredEnemies;
  final List<Map<String, dynamic>> threats;

  ScoreBreakdown({
    required this.laneScore,
    required this.mainScore,
    required this.counterScore,
    required this.total,
    required this.counteredEnemies,
    required this.threats,
  });
}

class CounterPickerState extends Equatable {
  final List<HeroModel> enemyTeam, recommendations;
  final HeroLane selectedLane;
  final Map<String, ScoreBreakdown> scores;

  const CounterPickerState({
    this.enemyTeam = const [],
    this.recommendations = const [],
    this.selectedLane = HeroLane.fill,
    this.scores = const {},
  });

  @override
  List<Object> get props => [enemyTeam, recommendations, selectedLane, scores];

  CounterPickerState copyWith({
    List<HeroModel>? enemyTeam,
    List<HeroModel>? recommendations,
    HeroLane? selectedLane,
    Map<String, ScoreBreakdown>? scores,
  }) {
    return CounterPickerState(
      enemyTeam: enemyTeam ?? this.enemyTeam,
      recommendations: recommendations ?? this.recommendations,
      selectedLane: selectedLane ?? this.selectedLane,
      scores: scores ?? this.scores,
    );
  }
}

class CounterPickerCubit extends Cubit<CounterPickerState> {
  CounterPickerCubit() : super(const CounterPickerState());

  void setLane(HeroLane lane, MainHeroPoolState pool) {
    emit(state.copyWith(selectedLane: lane));
    _calculate(state.enemyTeam, pool, lane);
  }

  void addEnemy(HeroModel hero, MainHeroPoolState pool) {
    if (state.enemyTeam.length >= 5 || state.enemyTeam.contains(hero)) return;
    final updated = List<HeroModel>.from(state.enemyTeam)..add(hero);
    _calculate(updated, pool, state.selectedLane);
  }

  void removeEnemy(HeroModel hero, MainHeroPoolState pool) {
    final updated = List<HeroModel>.from(state.enemyTeam)..remove(hero);
    _calculate(updated, pool, state.selectedLane);
  }

  void _calculate(
      List<HeroModel> enemies, MainHeroPoolState pool, HeroLane lane) {
    if (enemies.isEmpty) {
      emit(state.copyWith(enemyTeam: enemies, recommendations: [], scores: {}));
      return;
    }

    final all = HeroRepository.getAllHeroes();
    final Map<HeroModel, ScoreBreakdown> heroBreakdowns = {};

    for (var h in all) {
      if (enemies.contains(h)) continue;

      // ۱. اصلاح امتیاز لاین: ۲۵+ برای لاین درست و ۵۰- برای تداخل لاین [اصلاح درخواستی]
      int lS = (lane != HeroLane.fill)
          ? (h.preferredLanes.contains(lane) ? 25 : -50)
          : 0;

      // ۲. امتیاز هیرو Main: ۳۵+
      int mS = pool.mainHeroIds.contains(h.id) ? 35 : 0;

      int cS = 0;
      List<String> countered = [];
      List<Map<String, dynamic>> threats = [];

      for (var e in enemies) {
        if (h.strongAgainstHeroIds.contains(e.id)) {
          cS += 35;
          countered.add(e.name);
        }
        if (h.counterHeroIds.contains(e.id)) {
          cS -= 35;
          threats.add({'name': e.name, 'penalty': -35});
        }
      }

      int total = lS + mS + cS;

      // فیلتر هیروهایی که ارزش تاکتیکی ندارند (Main نیستند و کسی را کانتر نمی‌کنند)
      if ((mS > 0 || cS > 0) && total > -80) {
        heroBreakdowns[h] = ScoreBreakdown(
          laneScore: lS,
          mainScore: mS,
          counterScore: cS,
          total: total,
          counteredEnemies: countered,
          threats: threats,
        );
      }
    }

    final sorted = heroBreakdowns.keys.toList()
      ..sort((a, b) =>
          heroBreakdowns[b]!.total.compareTo(heroBreakdowns[a]!.total));

    emit(state.copyWith(
      enemyTeam: enemies,
      recommendations: sorted,
      scores: heroBreakdowns.map((k, v) => MapEntry(k.id, v)),
    ));
  }
}
