import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart'; // ایمپورت فایل جدید

class MenuOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  const MenuOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    // بررسی حالت حباب برای تنظیم سایزها
    final isBubble = AppResponsive.isBubbleMode(context);
    final p = AppResponsive.padding(context, 20); // پدینگ هوشمند

    return Container(
      margin: EdgeInsets.only(bottom: isBubble ? 8 : 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(isBubble ? 12 : 20),
          splashColor: AppTheme.primary.withOpacity(0.3),
          child: Ink(
            padding: EdgeInsets.all(p),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(isBubble ? 12 : 20),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: isBubble ? 5 : 10,
                  offset: Offset(0, isBubble ? 2 : 5),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppTheme.surface, AppTheme.surface.withBlue(50)],
              ),
            ),
            child: Row(
              children: [
                // آیکون
                Container(
                  padding: EdgeInsets.all(isBubble ? 8 : 12),
                  decoration: BoxDecoration(
                    color: (iconColor ?? AppTheme.primary).withOpacity(0.15),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: (iconColor ?? AppTheme.primary).withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? AppTheme.primary,
                    size: AppResponsive.iconSize(context, 28),
                  ),
                ),
                SizedBox(width: isBubble ? 10 : 16),

                // متن‌ها
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: AppResponsive.fontSize(
                            context,
                            20,
                          ), // کمی کوچکتر از تم اصلی
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (!isBubble) ...[
                        // اگر خیلی کوچک شد، ساب تایتل را حذف کن تا شلوغ نشود
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: AppResponsive.fontSize(context, 14),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                // فلش کوچک
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white.withOpacity(0.3),
                  size: isBubble ? 12 : 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
