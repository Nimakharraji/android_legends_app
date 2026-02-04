import 'package:equatable/equatable.dart';
import '../../core/constants/enums.dart';
import '../../data/models/hero_model.dart';

// وضعیت‌های مختلف عملیات آنالیز
enum CounterPickerStatus { initial, loading, loaded, empty, error }

class ScoreBreakdown extends Equatable {
  final double laneScore;      // امتیاز تطابق با لاین
  final double mainScore;      // امتیاز قدرت پایه (Meta/WinRate)
  final double counterScore;   // امتیاز حاصل از کانتر کردن دشمنان
  final double mainBonus;      // امتیاز پاداش برای هیروهای مِین (جدید)
  final double total;          // مجموع نهایی
  final List<String> counteredEnemies; // لیست نام دشمنانی که این هیرو کانتر می‌کند

  const ScoreBreakdown({
    required this.laneScore,
    required this.mainScore,
    required this.counterScore,
    required this.mainBonus,    // اضافه شدن به سازنده
    required this.total,
    required this.counteredEnemies,
  });

  @override
  // اضافه کردن mainBonus به props برای مقایسه صحیح وضعیت‌ها
  List<Object?> get props => [
        laneScore,
        mainScore,
        counterScore,
        mainBonus,
        total,
        counteredEnemies,
      ];
}

class CounterPickerState extends Equatable {
  final List<HeroModel> enemyTeam;
  final List<HeroModel> recommendations;
  final HeroLane selectedLane;
  final Map<String, ScoreBreakdown> scores;
  final CounterPickerStatus status;
  final String? errorMessage;

  const CounterPickerState({
    this.enemyTeam = const [],
    this.recommendations = const [],
    this.selectedLane = HeroLane.fill,
    this.scores = const {},
    this.status = CounterPickerStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        enemyTeam,
        recommendations,
        selectedLane,
        scores,
        status,
        errorMessage,
      ];

  CounterPickerState copyWith({
    List<HeroModel>? enemyTeam,
    List<HeroModel>? recommendations,
    HeroLane? selectedLane,
    Map<String, ScoreBreakdown>? scores,
    CounterPickerStatus? status,
    String? errorMessage,
  }) {
    return CounterPickerState(
      enemyTeam: enemyTeam ?? this.enemyTeam,
      recommendations: recommendations ?? this.recommendations,
      selectedLane: selectedLane ?? this.selectedLane,
      scores: scores ?? this.scores,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}