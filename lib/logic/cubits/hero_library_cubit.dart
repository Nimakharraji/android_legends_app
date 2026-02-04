import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';

// --- Hero Library State ---
class HeroLibraryState extends Equatable {
  final List<HeroModel> allHeroes;
  final String searchQuery;
  final bool isLoading;

  const HeroLibraryState({
    this.allHeroes = const [],
    this.searchQuery = '',
    this.isLoading = false,
  });

  // متد کمکی برای گرفتن لیست فیلتر شده بر اساس جست‌وجو
  List<HeroModel> get filteredHeroes {
    if (searchQuery.isEmpty) return allHeroes;
    return allHeroes
        .where((hero) =>
            hero.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

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

// --- Hero Library Cubit ---
class HeroLibraryCubit extends Cubit<HeroLibraryState> {
  // ۱. تعریف فیلد ریپازیتوری برای استفاده از متدهای غیر استاتیک
  final HeroRepository _repository;

  // ۲. دریافت ریپازیتوری از طریق Constructor (حل ارور Provider)
  HeroLibraryCubit(this._repository) : super(const HeroLibraryState());

  // ۳. متد بارگذاری هیروها از دیتابیس ۱۳۱ تایی
  void loadHeroes() {
    emit(state.copyWith(isLoading: true));

    try {
      // استفاده از نمونه ریپازیتوری به جای فراخوانی استاتیک (حل ارور تصویر 4)
      final heroes = _repository.getAllHeroes();
      emit(state.copyWith(allHeroes: heroes, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  // ۴. به‌روزرسانی متن جست‌وجو
  void updateSearch(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}