import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/enums.dart';
import '../../data/repositories/hero_repository.dart';
import '../../logic/cubits/main_hero_pool_cubit.dart';
import '../../logic/cubits/pinned_hero_cubit.dart';
import '../widgets/hero_avatar_item.dart';

class MainHeroPoolScreen extends StatelessWidget {
  const MainHeroPoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1E),
      appBar: AppBar(
        title:
            const Text("BUILD YOUR POOL", style: TextStyle(letterSpacing: 2)),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_off_outlined),
            onPressed: () => context.read<MainHeroPoolCubit>().clearFilters(),
          )
        ],
      ),
      body: BlocBuilder<MainHeroPoolCubit, MainHeroPoolState>(
        builder: (context, poolState) {
          return BlocBuilder<PinnedHeroesCubit, PinnedHeroesState>(
            builder: (context, pinState) {
              // ۱. فیلتر کردن هیروها بر اساس انتخاب کاربر
              final filteredHeroes =
                  HeroRepository.getAllHeroes().where((hero) {
                final roleMatch = poolState.selectedRole == null ||
                    hero.role == poolState.selectedRole;
                final laneMatch = poolState.selectedLane == null ||
                    hero.preferredLanes.contains(poolState.selectedLane);
                return roleMatch && laneMatch;
              }).toList();

              // ۲. سورتینگ (پین شده‌ها اول)
              filteredHeroes.sort((a, b) {
                final aP = pinState.pinnedIds.contains(a.id);
                final bP = pinState.pinnedIds.contains(b.id);
                if (aP && !bP) return -1;
                if (!aP && bP) return 1;
                return 0;
              });

              return Column(
                children: [
                  // ۳. بخش فیلترها (Role & Lane)
                  _buildFilterSection(context, poolState),

                  const Divider(color: Colors.white10, height: 1),

                  // ۴. نمایش تعداد نتایج و هیروهای انتخاب شده
                  _buildStatusHeader(poolState),

                  Expanded(
                    child: filteredHeroes.isEmpty
                        ? const Center(
                            child: Text("No heroes match these filters",
                                style: TextStyle(color: Colors.white24)))
                        : GridView.builder(
                            padding: const EdgeInsets.all(16),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 0.55,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12),
                            itemCount: filteredHeroes.length,
                            itemBuilder: (context, index) {
                              final hero = filteredHeroes[index];
                              final isMain =
                                  poolState.mainHeroIds.contains(hero.id);

                              return GestureDetector(
                                onTap: () => context
                                    .read<MainHeroPoolCubit>()
                                    .toggleHero(hero.id),
                                child: Opacity(
                                  opacity: isMain ? 1.0 : 0.4,
                                  child: HeroAvatarItem(
                                      hero: hero,
                                      onTap: () => context
                                          .read<MainHeroPoolCubit>()
                                          .toggleHero(hero.id) // حل ارور onTap
                                      ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, MainHeroPoolState state) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          // فیلتر رول‌ها
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: HeroRole.values
                  .map((role) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(role.label,
                              style: const TextStyle(fontSize: 10)),
                          selected: state.selectedRole == role,
                          onSelected: (val) => context
                              .read<MainHeroPoolCubit>()
                              .setRoleFilter(val ? role : null),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
          // فیلتر لاین‌ها
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: HeroLane.values
                  .map((lane) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(lane.label,
                              style: const TextStyle(fontSize: 10)),
                          selected: state.selectedLane == lane,
                          onSelected: (val) => context
                              .read<MainHeroPoolCubit>()
                              .setLaneFilter(val ? lane : null),
                          selectedColor:
                              // ignore: deprecated_member_use
                              const Color(0xFF00D2FF).withOpacity(0.3),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusHeader(MainHeroPoolState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("SELECTED: ${state.mainHeroIds.length}",
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 10,
                  fontWeight: FontWeight.bold)),
          if (state.selectedRole != null || state.selectedLane != null)
            const Text("FILTER ACTIVE",
                style: TextStyle(color: Color(0xFF00D2FF), fontSize: 9)),
        ],
      ),
    );
  }
}
