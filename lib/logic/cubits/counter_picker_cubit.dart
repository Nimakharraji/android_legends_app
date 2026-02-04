import 'package:bloc/bloc.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';
import '../services/start_matchup_services.dart';
import 'counter_picker_state.dart';
import '../../core/constants/enums.dart';

class CounterPickerCubit extends Cubit<CounterPickerState> {
  final HeroRepository _repository;
  final StatMatchupService _statService = StatMatchupService(); // سرویس جدید
  late final List<HeroModel> _allHeroes;

  CounterPickerCubit(this._repository) : super(const CounterPickerState()) {
    _allHeroes = _repository.getAllHeroes(); // بارگذاری ۱۳۱ هیرو
  }

  void analyzeDraft({
    required List<HeroModel> enemyTeam,
    required HeroLane selectedLane,
    required List<String> userMainHeroIds, // لیست هیروهای مِین کاربر
  }) {
    emit(state.copyWith(
      status: CounterPickerStatus.loading,
      enemyTeam: enemyTeam,
      selectedLane: selectedLane,
    ));

    try {
      final Map<String, ScoreBreakdown> heroScores = {};
      final List<HeroModel> laneCandidates = _allHeroes
          .where((h) =>
              h.preferredLanes.contains(selectedLane) ||
              selectedLane == HeroLane.fill)
          .toList();

      for (var candidate in laneCandidates) {
        if (enemyTeam.any((e) => e.id == candidate.id)) continue;

        // ۱. تحلیل چارت‌های آماری (Meta Power تخصصی)
        double metaPower =
            _statService.getDynamicMetaPower(candidate, enemyTeam);

        // ۲. امتیاز تعلق (Main Bonus)
        double mainBonus = userMainHeroIds.contains(candidate.id) ? 12.0 : 0.0;

        // ۳. امتیاز کانتر (منطق دوطرفه و Case-Insensitive)
        double counterScore = 0.0;
        List<String> counteredEnemies = [];
        for (var enemy in enemyTeam) {
          String cId = candidate.id.toLowerCase();
          String eId = enemy.id.toLowerCase();

          // اگر ما آن‌ها را کانتر کنیم یا آن‌ها در برابر ما ضعیف باشند
          if (candidate.strongAgainstHeroIds.contains(eId) ||
              enemy.counterHeroIds.contains(cId)) {
            counterScore += 25.0;
            counteredEnemies.add(enemy.name);
          }

          // اگر آن‌ها ما را کانتر کنند (جریمه سنگین)
          if (candidate.counterHeroIds.contains(eId)) {
            counterScore -= 20.0;
          }
        }

        // ۴. امتیاز لاین تخصصی
        double laneScore =
            candidate.preferredLanes.contains(selectedLane) ? 20.0 : -15.0;

        // مجموع نهایی
        double total = laneScore + metaPower + counterScore + mainBonus;

        heroScores[candidate.id] = ScoreBreakdown(
          laneScore: laneScore,
          mainScore: metaPower,
          counterScore: counterScore,
          mainBonus: mainBonus,
          total: total,
          counteredEnemies: counteredEnemies,
        );
      }

      // ۵. مرتب‌سازی هوشمند (نزولی)
      laneCandidates.sort((a, b) => (heroScores[b.id]?.total ?? 0)
          .compareTo(heroScores[a.id]?.total ?? 0));

      emit(state.copyWith(
        status: CounterPickerStatus.loaded,
        recommendations: laneCandidates.take(15).toList(),
        scores: heroScores,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: CounterPickerStatus.error, errorMessage: e.toString()));
    }
  }
}
