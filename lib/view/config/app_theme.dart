import 'package:flutter/material.dart';
import 'package:flutter_app/view/config/app_colors.dart';

/// 主题配置
final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primary, // 主题颜色
  scaffoldBackgroundColor: AppColors.page, // 页面背景颜色
  indicatorColor: AppColors.active, // 选项卡颜色
  splashColor: Colors.transparent, // 取消水波纹效果
  highlightColor: Colors.transparent, // 取消水波纹效果
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: AppColors.negative1 // 文字颜色
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.nav,
    elevation: 0,
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppColors.negative1,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 18,
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 12),
  ),
  // 底部按钮主题
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.nav,
    selectedItemColor: AppColors.active,
    unselectedItemColor: AppColors.negative1,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
    ),
  ),
);
