// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/enums.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';
import '../../logic/cubits/counter_picker_cubit.dart';
import '../../logic/cubits/main_hero_pool_cubit.dart';
import '../../logic/cubits/counter_picker_state.dart';
import '../widgets/hero_selector_sheet.dart';
import '../widgets/hero_state_chart.dart';

class CounterPickerScreen extends StatelessWidget {
  const CounterPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterPickerCubit(context.read<HeroRepository>()),
      child: const CounterPickerView(),
    );
  }
}

class CounterPickerView extends StatelessWidget {
  const CounterPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final pool = context.watch<MainHeroPoolCubit>().state;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1E),
      appBar: AppBar(
        title: const Text("STRATEGIC DRAFT", 
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<CounterPickerCubit, CounterPickerState>(
        builder: (context, state) {
          if (state.status == CounterPickerStatus.loading) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFF00D2FF)));
          }

          final idealPick = state.recommendations.isNotEmpty ? state.recommendations.first : null;
          final mainRecs = state.recommendations
              .where((h) => pool.mainHeroIds.contains(h.id))
              .toList();
          
          HeroModel? yourMainPick;
          if (mainRecs.isNotEmpty) {
            yourMainPick = (idealPick != null && mainRecs.first.id == idealPick.id && mainRecs.length > 1)
                ? mainRecs[1]
                : mainRecs.first;
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildLaneSelector(context, state.selectedLane, pool.mainHeroIds)),
              SliverToBoxAdapter(child: _buildEnemySlots(context, state.enemyTeam, pool.mainHeroIds)),
              
              if (state.status == CounterPickerStatus.loaded && state.recommendations.isNotEmpty) ...[
                _buildSectionHeader("TOP RECOMMENDATIONS"),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 240,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        if (yourMainPick != null)
                          _portraitCard(context, yourMainPick, "YOUR MAIN", Colors.amber, state),
                        const SizedBox(width: 15),
                        if (idealPick != null)
                          _portraitCard(context, idealPick, "IDEAL PICK", const Color(0xFF00D2FF), state),
                      ],
                    ),
                  ),
                ),

                _buildSectionHeader("RESERVE COUNTERS"),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final hero = state.recommendations[i];
                        final score = state.scores[hero.id]?.total.toInt() ?? 0;
                        return _buildHeroListTile(context, hero, score, state);
                      },
                      childCount: state.recommendations.length,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 50)),
              ] else if (state.enemyTeam.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text("Select enemy heroes to analyze", 
                    style: TextStyle(color: Colors.white24, fontSize: 13))),
                ),
            ],
          );
        },
      ),
    );
  }

  // --- UI Helpers ---

  Widget _buildSectionHeader(String title) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 15),
      sliver: SliverToBoxAdapter(
        child: Text(title, style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
      ),
    );
  }

  Widget _buildLaneSelector(BuildContext context, HeroLane current, List<String> mainIds) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: HeroLane.values.map((l) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(l.label),
            selected: current == l,
            onSelected: (_) => context.read<CounterPickerCubit>().analyzeDraft(
              enemyTeam: context.read<CounterPickerCubit>().state.enemyTeam,
              selectedLane: l,
              userMainHeroIds: mainIds,
            ),
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildEnemySlots(BuildContext context, List<HeroModel> enemies, List<String> mainIds) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (i) {
          final h = i < enemies.length ? enemies[i] : null;
          return GestureDetector(
            onTap: () => _handleEnemyTap(context, h, enemies, mainIds),
            child: Container(
              width: 60, height: 80,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: h != null ? Colors.red.withOpacity(0.5) : Colors.white10, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: h != null ? Image.asset(h.imagePath, fit: BoxFit.cover) : const Icon(Icons.add, color: Colors.white10),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _handleEnemyTap(BuildContext context, HeroModel? h, List<HeroModel> enemies, List<String> mainIds) {
    if (h == null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => HeroSelectorSheet(
          excludedHeroes: enemies,
          onHeroSelected: (newH) {
            final newList = List<HeroModel>.from(enemies)..add(newH);
            context.read<CounterPickerCubit>().analyzeDraft(
              enemyTeam: newList,
              selectedLane: context.read<CounterPickerCubit>().state.selectedLane,
              userMainHeroIds: mainIds,
            );
          },
        ),
      );
    }
  }

  Widget _portraitCard(BuildContext context, HeroModel hero, String label, Color accent, CounterPickerState state) {
    final score = state.scores[hero.id]?.total.toInt() ?? 0;
    return GestureDetector(
      onTap: () => _showAnalysis(context, hero, state),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: accent.withOpacity(0.5), width: 2),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(hero.imagePath, fit: BoxFit.cover, height: double.infinity, width: double.infinity),
              ),
              Positioned.fill(child: Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withOpacity(0.9)]),
              ))),
              Positioned(top: 12, right: 12, child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(8)),
                child: Text("$score", style: TextStyle(color: accent, fontSize: 12, fontWeight: FontWeight.bold)),
              )),
              Positioned(bottom: 20, left: 15, child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 9, color: accent, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  Text(hero.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroListTile(BuildContext context, HeroModel hero, int score, CounterPickerState state) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04), 
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
        leading: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white10)),
          child: CircleAvatar(backgroundImage: AssetImage(hero.imagePath), radius: 24),
        ),
        title: Text(hero.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text("Strategic Score: $score", style: const TextStyle(color: Colors.white38, fontSize: 12)),
        trailing: Container(
          decoration: BoxDecoration(color: const Color(0xFF00D2FF).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: IconButton(
            icon: const Icon(Icons.bar_chart_rounded, color: Color(0xFF00D2FF)), 
            onPressed: () => _showAnalysis(context, hero, state),
          ),
        ),
      ),
    );
  }

  void _showAnalysis(BuildContext context, HeroModel hero, CounterPickerState state) {
    final sc = state.scores[hero.id];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.82,
        decoration: const BoxDecoration(color: Color(0xFF161626), borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(children: [
            _buildScoreCircle(sc?.total.toInt() ?? 0),
            const SizedBox(height: 35),
            _scoreTile("Meta Power", sc?.mainScore.toInt() ?? 0, Icons.auto_awesome, Colors.amber),
            _scoreTile("Lane Efficiency", sc?.laneScore.toInt() ?? 0, Icons.explore, Colors.blue),
            _scoreTile("Counter Advantage", sc?.counterScore.toInt() ?? 0, Icons.security, Colors.green),
            // اضافه شدن بخش امتیاز مِین
            _scoreTile("Main Affinity", sc?.mainBonus.toInt() ?? 0, Icons.favorite, Colors.pinkAccent),
            
            if (sc != null && sc.counteredEnemies.isNotEmpty) ...[
              const SizedBox(height: 25),
              const Align(alignment: Alignment.centerLeft, child: Text("COUNTERS FOUND", style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1.5))),
              const SizedBox(height: 10),
              Wrap(spacing: 8, children: sc.counteredEnemies.map((e) => Chip(
                backgroundColor: Colors.green.withOpacity(0.1),
                side: BorderSide.none,
                label: Text(e, style: const TextStyle(color: Colors.green, fontSize: 11)),
              )).toList()),
            ],
            const Divider(color: Colors.white10, height: 60),
            // نمودار راداری اصلاح شده
            HeroStatsChart(stats: hero.stats),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }

  Widget _buildScoreCircle(int total) => Container(
    width: 110, height: 110,
    decoration: BoxDecoration(
      shape: BoxShape.circle, 
      border: Border.all(color: const Color(0xFF00D2FF), width: 3),
      boxShadow: [BoxShadow(color: const Color(0xFF00D2FF).withOpacity(0.15), blurRadius: 30, spreadRadius: 2)],
    ),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("$total", style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.white)),
      const Text("TOTAL", style: TextStyle(fontSize: 10, color: Colors.white38, letterSpacing: 1.5)),
    ]),
  );

  Widget _scoreTile(String t, int p, IconData i, Color c) => Padding(
    padding: const EdgeInsets.only(bottom: 18),
    child: Row(
      children: [
        Icon(i, color: c, size: 22),
        const SizedBox(width: 15),
        Text(t, style: const TextStyle(color: Colors.white70, fontSize: 15)),
        const Spacer(),
        Text(p >= 0 ? "+$p" : "$p", style: TextStyle(color: p >= 0 ? c : Colors.red, fontWeight: FontWeight.bold, fontSize: 17)),
      ],
    ),
  );
}