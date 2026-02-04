import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';
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
    // ۱. دریافت نمونه ریپازیتوری از Context برای حل ارور استاتیک
    final heroRepo = context.read<HeroRepository>();
    final pinnedIds = context.watch<PinnedHeroesCubit>().state.pinnedIds;
    
    // ۲. فیلتر کردن هیروها با استفاده از نمونه ریپازیتوری
    final filtered = heroRepo.getAllHeroes().where((h) => 
      h.name.toLowerCase().contains(_query.toLowerCase()) && 
      !widget.excludedHeroes.any((excluded) => excluded.id == h.id)
    ).toList();

    // ۳. مرتب‌سازی بر اساس پین شده‌ها (برای دسترسی سریع‌تر در درفت)
    filtered.sort((a, b) {
      final aP = pinnedIds.contains(a.id);
      final bP = pinnedIds.contains(b.id);
      if (aP && !bP) return -1;
      if (!aP && bP) return 1;
      return 0;
    });

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E2C), // رنگ تیره هماهنگ با تم Free Iran
        borderRadius: BorderRadius.vertical(top: Radius.circular(32))
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // نوار کشویی بالا برای زیبایی بصری
          Center(
            child: Container(
              width: 40, 
              height: 4, 
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(2)),
            ),
          ),
          
          // فیلد جست‌وجوی هوشمند
          TextField(
            onChanged: (v) => setState(() => _query = v),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search Enemy...', 
              hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.white24, size: 20), 
              filled: true, 
              fillColor: Colors.black26, 
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(vertical: 0)
            ),
          ),
          
          const SizedBox(height: 20),
          
          Expanded(
            child: filtered.isEmpty 
              ? const Center(child: Text("No hero found", style: TextStyle(color: Colors.white24)))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, 
                    childAspectRatio: 0.52, 
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 10
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) => HeroAvatarItem(
                    hero: filtered[index],
                    onTap: () { 
                      widget.onHeroSelected(filtered[index]); 
                      Navigator.pop(context); 
                    },
                  ),
                ),
          ),
        ],
      ),
    );
  }
}