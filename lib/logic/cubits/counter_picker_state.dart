import 'package:equatable/equatable.dart';

import '../../core/constants/enums.dart';
import '../../data/models/hero_model.dart';

class ScoreBreakdown {
  final int laneScore, mainScore, counterScore, total;
  final List<String> counteredEnemies; // لیست دشمنانی که توسط این هیرو کانتر می‌شوند

  ScoreBreakdown({
    required this.laneScore,
    required this.mainScore,
    required this.counterScore,
    required this.total,
    required this.counteredEnemies,
  });
}

class CounterPickerState extends Equatable {
  final List<HeroModel> enemyTeam, recommendations;
  final HeroLane selectedLane;
  final Map<String, ScoreBreakdown> scores; // ذخیره ریز نمرات با کلید ID هیرو

  const CounterPickerState({
    this.enemyTeam = const [],
    this.recommendations = const [],
    this.selectedLane = HeroLane.fill,
    this.scores = const {},
  });

  @override List<Object> get props => [enemyTeam, recommendations, selectedLane, scores];

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