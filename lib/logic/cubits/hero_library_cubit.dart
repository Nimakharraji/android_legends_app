import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';

class HeroLibraryState extends Equatable {
  final List<HeroModel> allHeroes;
  final String searchQuery; // فیلد جدید برای جست‌وجو
  final bool isLoading;

  const HeroLibraryState({
    this.allHeroes = const [],
    this.searchQuery = '',
    this.isLoading = false,
  });

  @override
  List<Object> get props => [allHeroes, searchQuery, isLoading];

  HeroLibraryState copyWith({
    List<HeroModel>? allHeroes,
    String? searchQuery,
    bool? isLoading,
  }) {
    return HeroLibraryState(
      allHeroes: allHeroes ?? this.allHeroes,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HeroLibraryCubit extends Cubit<HeroLibraryState> {
  HeroLibraryCubit() : super(const HeroLibraryState());

  void loadHeroes() {
    emit(state.copyWith(isLoading: true));
    final heroes = HeroRepository.getAllHeroes();
    emit(state.copyWith(allHeroes: heroes, isLoading: false));
  }

  // متد جدید برای به‌روزرسانی متن جست‌وجو
  void updateSearch(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}