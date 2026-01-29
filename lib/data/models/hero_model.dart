import 'package:equatable/equatable.dart';
import '../../core/constants/enums.dart';

class HeroStats extends Equatable {
  final double damage, durability, crowdControl, mobility, difficulty;
  const HeroStats({required this.damage, required this.durability, required this.crowdControl, required this.mobility, required this.difficulty});
  @override List<Object?> get props => [damage, durability, crowdControl, mobility, difficulty];
}

class HeroModel extends Equatable {
  final String id, name, imagePath, specialty, aiDescription, teamfightGuide;
  final int gameId; 
  final HeroRole role;
  final List<HeroLane> preferredLanes;
  final List<String> counterHeroIds, strongAgainstHeroIds;
  final HeroStats stats;
  final int winProbabilityBase;

  const HeroModel({
    required this.id, required this.gameId, required this.name, required this.imagePath, 
    required this.role, required this.preferredLanes, required this.specialty, 
    required this.aiDescription, required this.teamfightGuide, required this.stats, 
    this.winProbabilityBase = 50, this.counterHeroIds = const [], this.strongAgainstHeroIds = const [],
  });

  @override List<Object?> get props => [id, name];
}