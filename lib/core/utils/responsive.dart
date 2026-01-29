import 'package:flutter/material.dart';

class AppResponsive {
  // تشخیص حالت حباب
  static bool isBubbleMode(BuildContext context) {
    return MediaQuery.of(context).size.width < 350;
  }

  // متد محاسبه سایز فونت (کلمه get حذف شد)
  static double fontSize(BuildContext context, double normalSize) {
    return isBubbleMode(context) ? normalSize * 0.75 : normalSize;
  }

  // متد محاسبه پدینگ (کلمه get حذف شد)
  static double padding(BuildContext context, double normalPadding) {
    return isBubbleMode(context) ? normalPadding * 0.5 : normalPadding;
  }
  
  // متد محاسبه سایز آیکون (کلمه get حذف شد)
  static double iconSize(BuildContext context, double normalSize) {
    return isBubbleMode(context) ? normalSize * 0.7 : normalSize;
  }
}