// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../widgets/menu_option_card.dart';
import 'hero_library_screen.dart';
import 'counter_picker_screen.dart';
import 'main_hero_pool_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isBubble = AppResponsive.isBubbleMode(context);
    final hPadding = isBubble ? 12.0 : 20.0;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A2E),
              AppTheme.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: isBubble ? 10 : 20),

                // --- HEADER SECTION (آیکون ستینگ حذف شد) ---
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // وسط‌چین کردن عنوان
                  children: [
                    Column(
                      children: [
                        Text(
                          isBubble ? 'ML Drafter' : 'MLBB DRAFTER',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                            color: AppTheme.accent,
                            fontSize: AppResponsive.fontSize(context, 28),
                            letterSpacing: 4,
                            shadows: [
                              Shadow(
                                color: AppTheme.accent.withOpacity(0.5),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                        if (!isBubble)
                          Text(
                            'STRATEGIC ANALYSIS ENGINE',
                            style: GoogleFonts.rajdhani(
                              color: Colors.white24,
                              fontSize: 10,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: isBubble ? 15 : 30),

                // --- NAVIGATION MENU (تمام صفحه شده) ---
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: MenuOptionCard(
                          title: 'MY HERO POOL',
                          subtitle: 'Heroes you master',
                          icon: Icons.person_search_rounded,
                          iconColor: Colors.blueAccent,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MainHeroPoolScreen()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: MenuOptionCard(
                          title: 'COUNTER PICK',
                          subtitle: 'Smart draft analysis',
                          icon: Icons.radar_rounded,
                          iconColor: Colors.redAccent,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CounterPickerScreen()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: MenuOptionCard(
                          title: 'HERO LIBRARY',
                          subtitle: 'Stats & Strategies',
                          icon: Icons.auto_stories_rounded,
                          iconColor: AppTheme.accent,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HeroLibraryScreen()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // --- MODERN DEVELOPER FOOTER ---
                _buildDeveloperFooter(context, isBubble),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperFooter(BuildContext context, bool isBubble) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isBubble ? 10 : 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.terminal_rounded,
                  size: isBubble ? 12 : 14,
                  color: AppTheme.primary.withOpacity(0.3)),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.rajdhani(
                    fontSize: AppResponsive.fontSize(context, 12),
                    color: AppTheme.textSecondary.withOpacity(0.5),
                    letterSpacing: 2,
                  ),
                  children: [
                    const TextSpan(text: 'DEVELOPED BY '),
                    TextSpan(
                      text: 'NIMAKHARRAJI',
                      style: TextStyle(
                        color: AppTheme.primary.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
