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
              AppTheme.background, // برگشت به رنگ بک‌گراند قبلی
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            child: Column(
              children: [
                SizedBox(height: isBubble ? 10 : 30),

                // --- HEADER (MLBB DRAFTER) ---
                _buildHeader(context, isBubble),

                const Spacer(), // ایجاد فاصله منعطف

                // --- MENU OPTIONS (خوش‌فرم و بدون کشیدگی زشت) ---
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 500), // محدود کردن عرض در صفحات بزرگ
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildFixedCard(
                        context,
                        title: 'MY HERO POOL',
                        subtitle: 'Heroes you master',
                        icon: Icons.person_search_rounded,
                        color: Colors.blueAccent,
                        screen: const MainHeroPoolScreen(),
                      ),
                      const SizedBox(height: 16),
                      _buildFixedCard(
                        context,
                        title: 'COUNTER PICK',
                        subtitle: 'Smart draft analysis',
                        icon: Icons.radar_rounded,
                        color: Colors.redAccent,
                        screen: const CounterPickerScreen(),
                      ),
                      const SizedBox(height: 16),
                      _buildFixedCard(
                        context,
                        title: 'HERO LIBRARY',
                        subtitle: 'Stats & Strategies',
                        icon: Icons.auto_stories_rounded,
                        color: AppTheme.accent,
                        screen: const HeroLibraryScreen(),
                      ),
                    ],
                  ),
                ),

                const Spacer(), // ایجاد فاصله منعطف

                // --- FOOTER (برگشت به مدل قبلی) ---
                _buildDeveloperFooter(context, isBubble),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isBubble) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              isBubble ? 'ML Drafter' : 'MLBB DRAFTER',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppTheme.accent,
                fontSize: AppResponsive.fontSize(context, 30),
                letterSpacing: 3,
                shadows: [
                  Shadow(
                      color: AppTheme.accent.withOpacity(0.5), blurRadius: 12),
                ],
              ),
            ),
            if (!isBubble)
              const Text(
                'Win the draft, Win the game',
                style: TextStyle(
                    color: Colors.white24, fontSize: 11, letterSpacing: 1),
              ),
          ],
        ),
      ],
    );
  }

  // متد کمکی برای ساخت کارت با ارتفاع ثابت برای جلوگیری از زشت شدن
  Widget _buildFixedCard(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return SizedBox(
      height: 110, // ارتفاع ثابت برای حفظ زیبایی در هر سایزی
      width: double.infinity,
      child: MenuOptionCard(
        title: title,
        subtitle: subtitle,
        icon: icon,
        iconColor: color,
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      ),
    );
  }

  Widget _buildDeveloperFooter(BuildContext context, bool isBubble) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isBubble ? 10 : 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.terminal_rounded,
                  size: 16, color: AppTheme.primary.withOpacity(0.5)),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.rajdhani(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                    letterSpacing: 2,
                  ),
                  children: [
                    const TextSpan(text: 'DEVELOPED BY '),
                    TextSpan(
                      text: 'NIMAKHARRAJI',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: AppTheme.primary.withOpacity(0.5),
                              blurRadius: 8)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!isBubble)
            const Text(
              "STRATEGIC ANALYSIS v1.0.2",
              style: TextStyle(
                  color: Colors.white10, fontSize: 9, letterSpacing: 1),
            ),
        ],
      ),
    );
  }
}
