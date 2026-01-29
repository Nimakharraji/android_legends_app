import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';
import '../../core/theme/app_theme.dart';
import '../../logic/cubits/pinned_hero_cubit.dart';
import 'hero_avatar_item.dart';

class HeroSelectorSheet extends StatefulWidget {
  final Function(HeroModel) onHeroSelected;
  final List<HeroModel> excludedHeroes;
  const HeroSelectorSheet({super.key, required this.onHeroSelected, this.excludedHeroes = const []});

  @override State<HeroSelectorSheet> createState() => _HeroSelectorSheetState();
}

class _HeroSelectorSheetState extends State<HeroSelectorSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final pinnedIds = context.watch<PinnedHeroesCubit>().state.pinnedIds;
    
    final filtered = HeroRepository.getAllHeroes().where((h) => 
      h.name.toLowerCase().contains(_query.toLowerCase()) && !widget.excludedHeroes.contains(h)
    ).toList();

    // سورتینگ بر اساس پین در شیت انتخاب انمی
    filtered.sort((a, b) {
      final aP = pinnedIds.contains(a.id);
      final bP = pinnedIds.contains(b.id);
      if (aP && !bP) return -1;
      if (!aP && bP) return 1;
      return 0;
    });

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(color: AppTheme.surface, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(hintText: 'Search Enemy...', prefixIcon: const Icon(Icons.search), filled: true, fillColor: Colors.black26, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 0.52, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: filtered.length,
              itemBuilder: (context, index) => HeroAvatarItem(
                hero: filtered[index],
                onTap: () { widget.onHeroSelected(filtered[index]); Navigator.pop(context); },
              ),
            ),
          ),
        ],
      ),
    );
  }
}