import 'package:flutter/material.dart';

enum HeroRole { tank, fighter, assassin, mage, marksman, support }
enum HeroLane { gold, exp, mid, jungle, roam, fill }

extension HeroRoleExtension on HeroRole {
  String get label => name[0].toUpperCase() + name.substring(1);
  Color get color {
    switch (this) {
      case HeroRole.tank: return Colors.brown;
      case HeroRole.fighter: return Colors.redAccent;
      case HeroRole.assassin: return Colors.purpleAccent;
      case HeroRole.mage: return Colors.blueAccent;
      case HeroRole.marksman: return Colors.orangeAccent;
      case HeroRole.support: return Colors.greenAccent;
    }
  }
}

extension HeroLaneExtension on HeroLane {
  String get label {
    if (this == HeroLane.exp) return "EXP";
    if (this == HeroLane.mid) return "MID";
    if (this == HeroLane.gold) return "GOLD";
    return name[0].toUpperCase() + name.substring(1);
  }
}