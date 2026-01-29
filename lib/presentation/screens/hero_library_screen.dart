// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/hero_library_cubit.dart';
import '../../logic/cubits/pinned_hero_cubit.dart';
import '../widgets/hero_avatar_item.dart';
import '../widgets/hero_detail_sheet.dart';

class HeroLibraryScreen extends StatelessWidget {
  const HeroLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1E),
      appBar: AppBar(
        title: const Text("HERO LIBRARY",
            style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<HeroLibraryCubit, HeroLibraryState>(
        builder: (context, libState) {
          return BlocBuilder<PinnedHeroesCubit, PinnedHeroesState>(
            builder: (context, pinState) {
              // ۱. فیلتر و سورت هیروها
              final filteredHeroes = libState.allHeroes.where((hero) {
                return hero.name
                    .toLowerCase()
                    .contains(libState.searchQuery.toLowerCase());
              }).toList();

              filteredHeroes.sort((a, b) {
                final aP = pinState.pinnedIds.contains(a.id);
                final bP = pinState.pinnedIds.contains(b.id);
                if (aP && !bP) return -1;
                if (!aP && bP) return 1;
                return 0;
              });

              return CustomScrollView(
                slivers: [
                  // ۲. نوار جست‌وجو
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child: TextField(
                        onChanged: (v) =>
                            context.read<HeroLibraryCubit>().updateSearch(v),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search heroes...",
                          prefixIcon: const Icon(Icons.search,
                              color: Color(0xFF00D2FF)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.05),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),

                  // ۳. گرید هیروها با سیستم پین اصلاح شده
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final hero = filteredHeroes[index];
                          final isPinned = pinState.pinnedIds.contains(hero.id);

                          return Stack(
                            clipBehavior:
                                Clip.none, // اجازه خروج منطقه لمس از کادر
                            children: [
                              HeroAvatarItem(
                                hero: hero,
                                onTap: () =>
                                    _showHeroDetails(context, hero.id), //
                              ),

                              // دکمه پین جدید با منطقه لمس بزرگ (Hit Target)
                              if (isPinned)
                                Positioned(
                                  top: -5,
                                  right: -5,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior
                                        .opaque, // حساسیت به کلیک در کل منطقه
                                    onTap: () {
                                      // قابلیت Unpin سریع با یک کلیک
                                      context
                                          .read<PinnedHeroesCubit>()
                                          .togglePin(hero.id);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          12), // افزایش فضای لمس بدون بزرگ شدن آیکون
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF00D2FF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF00D2FF)
                                                    .withOpacity(0.6),
                                                blurRadius: 10)
                                          ],
                                        ),
                                        child: const Icon(
                                            Icons.push_pin_rounded,
                                            color: Colors.white,
                                            size: 14),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                        childCount: filteredHeroes.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void _showHeroDetails(BuildContext context, String heroId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => HeroDetailSheet(heroId: heroId), //
    );
  }
}
