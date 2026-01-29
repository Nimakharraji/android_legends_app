import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/constants/enums.dart';

class MainHeroPoolState extends Equatable {
  final List<String> mainHeroIds;
  final HeroRole? selectedRole; // فیلتر نقش
  final HeroLane? selectedLane; // فیلتر لاین

  const MainHeroPoolState({
    this.mainHeroIds = const [],
    this.selectedRole,
    this.selectedLane,
  });

  @override
  List<Object?> get props => [mainHeroIds, selectedRole, selectedLane];

  MainHeroPoolState copyWith({
    List<String>? mainHeroIds,
    HeroRole? Function()? selectedRole,
    HeroLane? Function()? selectedLane,
  }) {
    return MainHeroPoolState(
      mainHeroIds: mainHeroIds ?? this.mainHeroIds,
      selectedRole: selectedRole != null ? selectedRole() : this.selectedRole,
      selectedLane: selectedLane != null ? selectedLane() : this.selectedLane,
    );
  }

  // فقط لیست IDها را ذخیره می‌کنیم تا فیلترها با بستن اپ پاک شوند (انتخاب کاربر)
  Map<String, dynamic> toJson() => {'mainHeroIds': mainHeroIds};
  factory MainHeroPoolState.fromJson(Map<String, dynamic> json) => 
      MainHeroPoolState(mainHeroIds: List<String>.from(json['mainHeroIds'] ?? []));
}

class MainHeroPoolCubit extends HydratedCubit<MainHeroPoolState> {
  MainHeroPoolCubit() : super(const MainHeroPoolState());

  void toggleHero(String id) {
    final current = List<String>.from(state.mainHeroIds);
    current.contains(id) ? current.remove(id) : current.add(id);
    emit(state.copyWith(mainHeroIds: current));
  }

  void setRoleFilter(HeroRole? role) => 
      emit(state.copyWith(selectedRole: () => role));

  void setLaneFilter(HeroLane? lane) => 
      emit(state.copyWith(selectedLane: () => lane));

  void clearFilters() => 
      emit(state.copyWith(selectedRole: () => null, selectedLane: () => null));

  @override
  MainHeroPoolState? fromJson(Map<String, dynamic> json) => MainHeroPoolState.fromJson(json);
  @override
  Map<String, dynamic>? toJson(MainHeroPoolState state) => state.toJson();
}