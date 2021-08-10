import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/view/components/singer_card.dart';

class SingerPage extends StatefulWidget {
  SingerPage({Key? key}) : super(key: key);

  @override
  _SingerPageState createState() => _SingerPageState();
}

class _SingerPageState extends State<SingerPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10, // 初始化构建数量
      itemBuilder: (BuildContext context, int index) {
        bool isEven = index.isEven;
        double pl = isEven ? 18 : 9;
        double pr = isEven ? 9 : 18;

        return Container(
          padding: EdgeInsets.only(top: 18, left: pl, right: pr),
          color: Colors.white,
          child: SingerCard(),
        );
      },
      padding: EdgeInsets.only(top: 8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: MediaQuery.of(context).size.width / 1.5,
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 8,
      ),
    );
  }
}
