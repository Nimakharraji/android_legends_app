// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/enums.dart';
import '../../data/models/hero_model.dart';
import '../../logic/cubits/counter_picker_cubit.dart';
import '../../logic/cubits/main_hero_pool_cubit.dart';
import '../widgets/hero_selector_sheet.dart';
import '../widgets/hero_state_chart.dart';

class CounterPickerScreen extends StatelessWidget {
  const CounterPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterPickerCubit(),
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
        title: const Text("STRATEGIC DRAFT"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<CounterPickerCubit, CounterPickerState>(
        builder: (context, state) {
          final userBest = state.recommendations
              .where((h) => pool.mainHeroIds.contains(h.id))
              .toList();

          // استفاده از CustomScrollView برای حل مشکل اسکرول در حالت پنجره‌ای
          return CustomScrollView(
            slivers: [
              // ۱. بخش انتخاب لاین
              SliverToBoxAdapter(
                child: _buildLaneSelector(context, state.selectedLane, pool),
              ),

              // ۲. بخش اسلات‌های دشمن (قرمز رنگ)
              SliverToBoxAdapter(
                child: _buildEnemySlots(context, state.enemyTeam, pool),
              ),

              if (state.recommendations.isNotEmpty) ...[
                // ۳. هدر پیشنهادات برتر
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(24, 20, 24, 10),
                  sliver: SliverToBoxAdapter(
                    child: Text("TOP RECOMMENDATIONS",
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            letterSpacing: 1.5)),
                  ),
                ),

                // ۴. لیست افقی کارت‌های پرتره (Your Main & Ideal Pick)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 240,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        if (userBest.isNotEmpty)
                          _portraitCard(context, userBest.first, "YOUR MAIN",
                              Colors.amber, state),
                        const SizedBox(width: 15),
                        if (state.recommendations.isNotEmpty)
                          _portraitCard(context, state.recommendations.first,
                              "IDEAL PICK", const Color(0xFF00D2FF), state),
                      ],
                    ),
                  ),
                ),

                // ۵. هدر لیست رزرو
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(24, 25, 24, 10),
                  sliver: SliverToBoxAdapter(
                    child: Text("RESERVE COUNTERS",
                        style: TextStyle(
                            color: Colors.white24,
                            fontSize: 9,
                            letterSpacing: 2)),
                  ),
                ),

                // ۶. لیست پیشنهادات پایینی (اسکرول شونده به صورت یکپارچه)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final hero = state.recommendations[i];
                        final score = state.scores[hero.id]?.total ?? 0;
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(hero.imagePath)),
                          title: Text(hero.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          subtitle: Text("Match Score: $score",
                              style: const TextStyle(
                                  color: Colors.white38, fontSize: 11)),
                          trailing: IconButton(
                            icon: const Icon(Icons.bar_chart_rounded,
                                color: Color(0xFF00D2FF), size: 28),
                            onPressed: () =>
                                _showAnalysis(context, hero, state),
                          ),
                        );
                      },
                      childCount: state.recommendations.length,
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 50)),
              ] else if (state.enemyTeam.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                      child: Text("Select enemy heroes to analyze",
                          style: TextStyle(color: Colors.white24))),
                ),
            ],
          );
        },
      ),
    );
  }

  // --- متدهای کمکی ویجت‌ها ---

  Widget _buildLaneSelector(
      BuildContext context, HeroLane current, MainHeroPoolState pool) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
          children: HeroLane.values
              .map((l) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                        label: Text(l.label),
                        selected: current == l,
                        onSelected: (_) => context
                            .read<CounterPickerCubit>()
                            .setLane(l, pool)),
                  ))
              .toList()),
    );
  }

  Widget _buildEnemySlots(
      BuildContext context, List<HeroModel> enemies, MainHeroPoolState pool) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (i) {
            final h = i < enemies.length ? enemies[i] : null;
            return GestureDetector(
              onTap: () => h != null
                  ? context.read<CounterPickerCubit>().removeEnemy(h, pool)
                  : showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => HeroSelectorSheet(
                          excludedHeroes: enemies,
                          onHeroSelected: (newH) => context
                              .read<CounterPickerCubit>()
                              .addEnemy(newH, pool))),
              child: Container(
                width: 55,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: h != null
                            ? Colors.red.withOpacity(0.5)
                            : Colors.white10)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: h != null
                        ? Image.asset(h.imagePath, fit: BoxFit.cover)
                        : const Icon(Icons.add, color: Colors.white10)),
              ),
            );
          })),
    );
  }

  Widget _portraitCard(BuildContext context, HeroModel hero, String label,
      Color accent, CounterPickerState state) {
    final score = state.scores[hero.id]?.total ?? 0;
    return GestureDetector(
      onTap: () => _showAnalysis(context, hero, state),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: accent.withOpacity(0.3))),
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(hero.imagePath,
                    fit: BoxFit.cover, height: double.infinity)),
            Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                    backgroundColor: Colors.black87,
                    radius: 18,
                    child: Text("$score",
                        style: TextStyle(
                            color: accent,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)))),
            Positioned.fill(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8)
                            ])))),
            Positioned(
                bottom: 15,
                left: 15,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label,
                          style: TextStyle(
                              fontSize: 8,
                              color: accent,
                              fontWeight: FontWeight.bold)),
                      Text(hero.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ])),
          ]),
        ),
      ),
    );
  }

  void _showAnalysis(
      BuildContext context, HeroModel hero, CounterPickerState state) {
    final sc = state.scores[hero.id];
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                  color: Color(0xFF0F0F1E),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32))),
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                  child: Column(children: [
                _buildScoreCircle(sc?.total ?? 0),
                const SizedBox(height: 30),
                // نمایش نمرات جدید: ۳۵+ برای Main و ۵۰- برای تداخل لاین
                _scoreTile("Main Bonus", sc?.mainScore ?? 0, Icons.stars,
                    Colors.amber),
                _scoreTile(
                    "Lane Fit", sc?.laneScore ?? 0, Icons.map, Colors.blue),
                _scoreTile("Counter Power", sc?.counterScore ?? 0,
                    Icons.trending_up, Colors.green),

                if (sc != null && sc.threats.isNotEmpty) ...[
                  const SizedBox(height: 25),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("DANGER: ENEMY THREATS",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 10,
                              letterSpacing: 2))),
                  ...sc.threats
                      .map((t) => ListTile(
                            leading: const Icon(Icons.warning_amber_rounded,
                                color: Colors.redAccent),
                            title: Text("${t['name']} counters you",
                                style: const TextStyle(fontSize: 12)),
                            trailing: Text("${t['penalty']}",
                                style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),
                          ))
                      .toList(),
                ],
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(color: Colors.white10)),
                HeroStatsChart(stats: hero.stats),
              ])),
            ));
  }

  Widget _buildScoreCircle(int total) => Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF00D2FF))),
        child: Column(children: [
          Text("$total",
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF00D2FF))),
          const Text("SCORE",
              style: TextStyle(fontSize: 8, color: Colors.white38)),
        ]),
      );

  Widget _scoreTile(String t, int p, IconData i, Color c) => ListTile(
        leading: Icon(i, color: c, size: 20),
        title: Text(t, style: const TextStyle(fontSize: 13)),
        trailing: Text(p >= 0 ? "+$p" : "$p",
            style: TextStyle(
                color: p >= 0 ? c : Colors.red, fontWeight: FontWeight.bold)),
      );
}
