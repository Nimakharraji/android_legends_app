import 'package:bloc/bloc.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';
import '../services/start_matchup_services.dart';
import 'counter_picker_state.dart';
import '../../core/constants/enums.dart';

class CounterPickerCubit extends Cubit<CounterPickerState> {
  final HeroRepository _repository;
  final StatMatchupService _statService = StatMatchupService();
  late final List<HeroModel> _allHeroes;

  CounterPickerCubit(this._repository) : super(const CounterPickerState()) {
    // بارگذاری دیتابیس ۱۳۱ هیرو در هنگام راه‌اندازی
    _allHeroes = _repository.getAllHeroes();
  }

  /// متد اصلی تحلیل درفت بر اساس چارت‌ها، کانترها و هیروهای مِین
  void analyzeDraft({
    required List<HeroModel> enemyTeam,
    required HeroLane selectedLane,
    required List<String> userMainHeroIds,
  }) {
    emit(state.copyWith(
      status: CounterPickerStatus.loading,
      enemyTeam: enemyTeam,
      selectedLane: selectedLane,
    ));

    try {
      if (enemyTeam.isEmpty) {
        emit(state.copyWith(status: CounterPickerStatus.empty, recommendations: [], scores: {}));
        return;
      }

      final Map<String, ScoreBreakdown> heroScores = {};
      
      // ۱. فیلتر لاین (جلوگیری از پیشنهاد هیرو در لاین اشتباه)
      final List<HeroModel> laneCandidates = _allHeroes.where((h) =>
              h.preferredLanes.contains(selectedLane) ||
              selectedLane == HeroLane.fill)
          .toList();

      for (var candidate in laneCandidates) {
        // جلوگیری از پیشنهاد هیروهایی که قبلاً توسط حریف انتخاب شده‌اند
        if (enemyTeam.any((e) => e.id == candidate.id)) continue;

        // ۲. تحلیل تخصصی چارت‌های آماری از سرویس اختصاصی
        double metaPower = _statService.getDynamicMetaPower(candidate, enemyTeam);

        // ۳. اعمال پاداش هیروهای مِین کاربر (+12 امتیاز)
        double mainBonus = userMainHeroIds.contains(candidate.id) ? 12.0 : 0.0;

        // ۴. تحلیل کانترهای مستقیم (Hard Counters)
        double counterScore = 0.0;
        List<String> counteredEnemies = [];
        for (var enemy in enemyTeam) {
          String cId = candidate.id.toLowerCase();
          String eId = enemy.id.toLowerCase();

          // بررسی روابط دوطرفه کانتر
          if (candidate.strongAgainstHeroIds.contains(eId) ||
              enemy.counterHeroIds.contains(cId)) {
            counterScore += 25.0;
            counteredEnemies.add(enemy.name);
          }

          if (candidate.counterHeroIds.contains(eId)) {
            counterScore -= 20.0; // جریمه برای انتخاب هیروی ضعیف در برابر حریف
          }
        }

        // ۵. امتیاز تطبیق با لاین
        double laneScore = candidate.preferredLanes.contains(selectedLane) ? 20.0 : -15.0;

        // مجموع نهایی امتیاز استراتژیک
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

      // ۶. مرتب‌سازی هوشمند (نزولی: بهترین انتخاب‌ها در صدر)
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

  /// متد حذف هیرو از لیست دشمن و آنالیز مجدد
  void removeEnemy(HeroModel hero, List<String> userMainHeroIds) {
    final newList = List<HeroModel>.from(state.enemyTeam)
      ..removeWhere((h) => h.id == hero.id);
    
    analyzeDraft(
      enemyTeam: newList,
      selectedLane: state.selectedLane,
      userMainHeroIds: userMainHeroIds,
    );
  }

  /// ریست کردن کامل درفت و بازگشت به حالت اولیه
  void clearDraft() {
    emit(const CounterPickerState(
      status: CounterPickerStatus.initial,
      enemyTeam: [],
      recommendations: [],
      scores: {},
    ));
  }
}