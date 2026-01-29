import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

class PinnedHeroesState extends Equatable {
  final List<String> pinnedIds;
  const PinnedHeroesState({this.pinnedIds = const []});

  @override List<Object> get props => [pinnedIds];

  // ذخیره‌سازی در حافظه
  Map<String, dynamic> toJson() => {'pinnedIds': pinnedIds};
  
  // بازیابی از حافظه
  factory PinnedHeroesState.fromJson(Map<String, dynamic> json) =>
      PinnedHeroesState(pinnedIds: List<String>.from(json['pinnedIds']));
}

class PinnedHeroesCubit extends HydratedCubit<PinnedHeroesState> {
  PinnedHeroesCubit() : super(const PinnedHeroesState());

  void togglePin(String heroId) {
    final current = List<String>.from(state.pinnedIds);
    current.contains(heroId) ? current.remove(heroId) : current.add(heroId);
    emit(PinnedHeroesState(pinnedIds: current));
  }

  @override PinnedHeroesState? fromJson(Map<String, dynamic> json) => PinnedHeroesState.fromJson(json);
  @override Map<String, dynamic>? toJson(PinnedHeroesState state) => state.toJson();
}