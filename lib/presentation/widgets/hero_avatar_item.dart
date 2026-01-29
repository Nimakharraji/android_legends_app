import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/hero_model.dart';
import '../../core/constants/enums.dart';
import '../../logic/cubits/pinned_hero_cubit.dart';

class HeroAvatarItem extends StatelessWidget {
  final HeroModel hero;
  final VoidCallback onTap;

  const HeroAvatarItem({super.key, required this.hero, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinnedHeroesCubit, PinnedHeroesState>(
      builder: (context, state) {
        final isPinned = state.pinnedIds.contains(hero.id);
        
        return GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // فریم مستطیلی ایستاده
                    AspectRatio(
                      aspectRatio: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isPinned ? Colors.amber : hero.role.color.withOpacity(0.5),
                            width: isPinned ? 3 : 1.5,
                          ),
                          image: DecorationImage(
                            image: AssetImage(hero.imagePath),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    // دکمه پین
                    Positioned(
                      top: 4, right: 4,
                      child: GestureDetector(
                        onTap: () => context.read<PinnedHeroesCubit>().togglePin(hero.id),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                          child: Icon(isPinned ? Icons.push_pin : Icons.push_pin_outlined, 
                            size: 14, color: isPinned ? Colors.amber : Colors.white24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // نام هیرو
              Text(hero.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
              // نمایش لاین‌ها به صورت متن (طبق درخواست شما)
              Text(
                hero.preferredLanes.map((l) => l.label).join("/"),
                style: TextStyle(fontSize: 9, color: hero.role.color.withOpacity(0.8), fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }
}