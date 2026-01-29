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

                // --- HEADER SECTION ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isBubble ? 'ML Drafter' : 'MLBB Drafter',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: AppTheme.accent,
                              fontSize: AppResponsive.fontSize(context, 32),
                              shadows: [
                                Shadow(
                                  color: AppTheme.accent.withOpacity(0.5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          if (!isBubble)
                            Text(
                              'Win the draft, Win the game',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // تنظیمات اپلیکیشن در آینده
                      },
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.white54,
                        size: AppResponsive.iconSize(context, 24),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isBubble ? 15 : 40),

                // --- NAVIGATION MENU ---
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      MenuOptionCard(
                        title: 'My Hero Pool',
                        subtitle: 'Heroes you master',
                        icon: Icons.person_search_rounded,
                        iconColor: Colors.blueAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const MainHeroPoolScreen()),
                          );
                        },
                      ),
                      MenuOptionCard(
                        title: 'Counter Pick',
                        subtitle: 'Smart draft analysis',
                        icon: Icons.radar_rounded,
                        iconColor: Colors.redAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CounterPickerScreen()),
                          );
                        },
                      ),
                      MenuOptionCard(
                        title: 'Hero Library',
                        subtitle: 'Stats & Strategies',
                        icon: Icons.auto_stories_rounded,
                        iconColor: AppTheme.accent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const HeroLibraryScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

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
      padding: EdgeInsets.symmetric(vertical: isBubble ? 10 : 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.05), width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.terminal_rounded, 
                size: isBubble ? 12 : 16, 
                color: AppTheme.primary.withOpacity(0.5)
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.rajdhani(
                    fontSize: AppResponsive.fontSize(context, 13),
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
                          Shadow(color: AppTheme.primary.withOpacity(0.5), blurRadius: 8)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!isBubble) ...[
            const SizedBox(height: 4),
            const Text(
              "STRATEGIC ANALYSIS v1.0.2",
              style: TextStyle(color: Colors.white10, fontSize: 9, letterSpacing: 1),
            ),
          ]
        ],
      ),
    );
  }
}