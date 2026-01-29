import 'package:flutter/material.dart';
import '../../data/models/hero_model.dart';
import '../../data/repositories/hero_repository.dart';
import '../../core/constants/enums.dart';
import '../../core/utils/responsive.dart';

class HeroDetailSheet extends StatelessWidget {
  // تغییر اساسی: دریافت ID به جای مدل کامل برای حل ارور تصویر image_269c35.png
  final String heroId; 
  const HeroDetailSheet({super.key, required this.heroId});

  @override
  Widget build(BuildContext context) {
    // استخراج هیرو از ریپازیتوری بر اساس ID ارسالی
    final hero = HeroRepository.getHeroById(heroId);
    
    // مدیریت حالت خطا (اگر هیرو پیدا نشد)
    if (hero == null) {
      return const Center(child: Text("Hero Not Found", style: TextStyle(color: Colors.white)));
    }

    final isBubble = AppResponsive.isBubbleMode(context);
    final theme = Theme.of(context);
    const double standardPortraitRatio = 0.7;

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1E1E2C),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: ListView(
            controller: controller,
            padding: EdgeInsets.all(isBubble ? 16 : 24),
            children: [
              // نوار کشویی بالا
              Center(
                child: Container(
                  width: 40, 
                  height: 4, 
                  margin: const EdgeInsets.only(bottom: 24), 
                  decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(2)),
                ),
              ),

              // بخش هدر: تصویر و اطلاعات اصلی
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: hero.id,
                    child: SizedBox(
                      width: isBubble ? 90 : 120,
                      child: AspectRatio(
                        aspectRatio: standardPortraitRatio,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: hero.role.color, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              hero.imagePath,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hero.name, 
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: AppResponsive.fontSize(context, 28), 
                            color: hero.role.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: hero.role.color.withOpacity(0.1), 
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${hero.role.label} • ${hero.specialty}", 
                            style: TextStyle(color: hero.role.color, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // بخش تحلیل هوش مصنوعی
              _buildSection("AI Analysis", hero.aiDescription, Icons.auto_awesome, theme),
              
              const SizedBox(height: 32),

              // بخش روابط هیروها: کانترا و قوت‌ها
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildRelationList("Weak Against", hero.counterHeroIds, Colors.redAccent)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildRelationList("Strong Against", hero.strongAgainstHeroIds, Colors.greenAccent)),
                ],
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, String content, IconData icon, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF00D2FF)), 
            const SizedBox(width: 8), 
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        const SizedBox(height: 12),
        Text(content, style: const TextStyle(color: Colors.white70, height: 1.6)),
      ],
    );
  }

  Widget _buildRelationList(String title, List<String> ids, Color color) {
    const double standardPortraitRatio = 0.7;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 12),
        ids.isEmpty 
          ? const Text("No specific data", style: TextStyle(color: Colors.white12, fontSize: 10))
          : Wrap(
              spacing: 8, 
              runSpacing: 8,
              children: ids.map((id) {
                final target = HeroRepository.getHeroById(id);
                if (target == null) return const SizedBox();
                return SizedBox(
                  width: 45,
                  child: AspectRatio(
                    aspectRatio: standardPortraitRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), 
                        border: Border.all(color: color.withOpacity(0.3)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(target.imagePath, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
      ],
    );
  }
}