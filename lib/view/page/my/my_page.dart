import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/my_avatar_card.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBar(
          backgroundColor: Colors.pink,
          title: Text("我的"),
        ),
        SizedBox(
          height: 15,
        ),
        MyAvatarCard(), // 我的头像卡片组件
        SizedBox(
          height: 15,
        ),
        ListTileTheme(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("测试"),
            tileColor: Colors.amber,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 14,
            ),
          ),
        ),
        ListTileTheme(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("测试"),
            tileColor: Colors.amber,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 14,
            ),
          ),
        ),
        ListTileTheme(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("测试"),
            tileColor: Colors.amber,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 14,
            ),
          ),
        ),
        ListTileTheme(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("测试"),
            tileColor: Colors.amber,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 14,
            ),
          ),
        ),
        ListTileTheme(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("测试"),
            tileColor: Colors.amber,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 14,
            ),
          ),
        ),
        ListTileTheme(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("测试"),
            tileColor: Colors.amber,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}
