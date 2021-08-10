import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/config/app_theme.dart';
import 'package:flutter_app/view/page/root_page.dart';

/// 程序主入口
void main() {
  runApp(MyApp());
}

/// 程序根目录
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: true, // 关闭debug模式
      // home: StartPage(),
      home: RootPage(),
    );
  }
}
