import 'package:flutter/material.dart';
import 'package:flutter_app/view/config/app_colors.dart';

/// 用户类型转换工具类
class UserType {
  static Map enType = {
    'USER': 'USER',
    'ADMIN': 'ADMIN',
    'SUPER_ADMIN': 'SUPER_ADMIN',
  };

  static Map cnType = {
    'USER': '普通用户',
    'ADMIN': '管理员',
    'SUPER_ADMIN': '超级管理员',
  };

  static Map colorType = {
    'USER': AppColors.negative1,
    'ADMIN': AppColors.info,
    'SUPER_ADMIN': AppColors.success,
  };

  /// 转英文
  static String formEn(String type) {
    return cnType[type];
  }

  /// 转中文
  static String formCn(String type) {
    return cnType[type] ?? '未知用户';
  }

  /// 转颜色
  static Color formColor(String type) {
    return colorType[type] ?? AppColors.negative1;
  }

  /// 是否是普通用户
  static bool isUser(String type) => true == enType['USER'];

  /// 是否是管理员
  static bool isAdmin(String type) => true == enType['ADMIN'];

  /// 是否是超级管理员
  static bool isSuperAdmin(String type) => true == enType['SUPER_ADMIN'];
}
