import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page/root_page.dart';

/// 启动页
class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/start.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                right: 10,
                child: InkWell(
                  child: clipRRectButton(),
                  onTap: jumpHomePage,
                ))
          ],
        ),
      ),
    );
  }

  // 跳过按钮
  Widget clipRRectButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blueGrey.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '跳过',
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12),
            ),
            Text(
              '$currentTime s',
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  late Timer timer;

  // 启动页倒计时
  int currentTime = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        currentTime--;
      });
      if (currentTime <= 0) {
        jumpHomePage();
      }
    });
  }

  // 跳转主页
  void jumpHomePage() {
    // 取消定时器
    timer.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => RootPage()),
        (route) => false);
  }
}
