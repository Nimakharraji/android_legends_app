import '../../data/models/hero_model.dart';

class StatMatchupService {
  /// تحلیل تقابل آماری دو هیرو بر اساس چارت راداری
  double calculateStatAdvantage(HeroStats candidate, HeroStats enemy) {
    double advantage = 0;

    // ۱. تداخل Damage vs Durability (آنتی‌تانک)
    if (enemy.durability > 7) {
      advantage += (candidate.damage - enemy.durability).clamp(0, 10) * 2.5;
    }

    // ۲. تداخل CC vs Mobility (آنتی‌اساسین)
    if (enemy.mobility > 7) {
      advantage += (candidate.crowdControl - enemy.mobility).clamp(0, 10) * 3.0;
    }

    // ۳. تداخل Mobility vs Damage (بقا و کایت کردن)
    if (enemy.damage > 8) {
      advantage += (candidate.mobility - enemy.damage).clamp(0, 10) * 1.5;
    }

    // ۴. پاداش مقاومت (Durability vs Burst)
    if (enemy.damage > 8 && candidate.durability > 7) {
      advantage += 10.0;
    }

    return advantage;
  }

  /// محاسبه میانگین Meta Power تخصصی در برابر کل تیم حریف
  double getDynamicMetaPower(HeroModel candidate, List<HeroModel> enemyTeam) {
    if (enemyTeam.isEmpty) return candidate.winProbabilityBase.toDouble();

    double totalAdvantage = 0;
    for (var enemy in enemyTeam) {
      totalAdvantage += calculateStatAdvantage(candidate.stats, enemy.stats);
    }

    // ترکیب Win Rate پایه با امتیاز تقابل آماری
    return candidate.winProbabilityBase + (totalAdvantage / enemyTeam.length);
  }
}