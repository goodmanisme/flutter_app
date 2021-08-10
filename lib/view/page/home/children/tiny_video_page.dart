import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/tiny_video_card.dart';

class TinyVideoPage extends StatefulWidget {
  TinyVideoPage({Key? key}) : super(key: key);

  @override
  _TinyVideoPageState createState() => _TinyVideoPageState();
}

class _TinyVideoPageState extends State<TinyVideoPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20, // 初始化构建数量
      itemBuilder: (BuildContext context, int index) {
        bool isEven = index.isEven;
        double pl = isEven ? 18 : 9;
        double pr = isEven ? 9 : 18;

        return Container(
          padding: EdgeInsets.only(top: 18, left: pl, right: pr),
          color: Colors.white,
          child: TinyVideoCard(),
        );
      },
      padding: EdgeInsets.only(top: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 1,
        childAspectRatio: 4 / 8,
      ),
    );
  }
}
