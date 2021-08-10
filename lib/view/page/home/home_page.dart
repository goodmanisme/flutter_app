import 'package:flutter/material.dart';
import 'package:flutter_app/src/service/home/home_service.dart';
import 'package:flutter_app/view/components/my_avatar_card.dart';
import 'package:flutter_app/view/components/root_page_head.dart';
import 'package:flutter_app/view/page/home/children/article_page.dart';
import 'package:flutter_app/view/page/home/children/image_page.dart';
import 'package:flutter_app/view/page/home/children/singer_page.dart';
import 'package:flutter_app/view/page/home/children/song_page.dart';
import 'package:flutter_app/view/page/home/children/tiny_video_page.dart';

/// 主页
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

const List<Tab> _tabs = [
  // Tab(text: '推荐'),
  Tab(text: '文章'),
  Tab(text: '歌手'),
  Tab(text: '音乐'),
  Tab(text: "图片"),
  Tab(text: '短视频'),
  // Tab(text: '小说'),
];

/// 主页标签页
final List<Widget> _tabsContent = [
  // RecommendPage(),
  ArticlePage(),
  SingerPage(),
  SongPage(),
  ImagePage(),
  TinyVideoPage(),
  // StoryPage(),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    /// 发起请求获取主页标签列表
    HomeService.getHomeTabNameList().then((value) => {
      print(value),
    }).catchError((error){
      print(error);
    });
    _tabController = TabController(
      initialIndex: 0, // 默认选中tab页索引位置
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: RootPageHead(),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true, // tab页超出滚动
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            MyAvatarCard(), // 用户头像组件
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
        ),
      ), // 首页头部抽屉
      body: TabBarView(
        children: _tabsContent,
        controller: _tabController,
      ),
    );
  }
}
