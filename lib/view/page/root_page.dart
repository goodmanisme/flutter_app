import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/menu_list.dart';
import 'package:flutter_app/src/service/home/home_service.dart';
import 'package:flutter_app/view/config/app_colors.dart';
import 'package:flutter_app/view/page/home/home_page.dart';
import 'package:flutter_app/view/page/my/my_page.dart';

/// 主页根节点
class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // 当前选中页索引
  int _currentIndex = 2;

  // 主页按钮列表
  final Map<String, String> _buttonNames = {
    'shouye': '首页',
    'shouji': '手机',
    'wode': '我的'
  };

  // 主页面集合
  final List<Widget> _pages = [
    HomePage(), // 主页
    Container(), // 上传功能页
    MyPage(), // 我的
  ];

  // 底部导航数组
  final List<BottomNavigationBarItem> _bottomNavigationBarItemList = [];

  @override
  void initState() {
    super.initState();
    // 生成底部导航结构
    _buttonNames.forEach((key, value) {
      _bottomNavigationBarItemList.add(bottomNavigationBarItem(key, value));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用setState函数都会执行该方法
    return Scaffold(
      body: _pages[_currentIndex],
      // 动态切换页面
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItemList,
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        type: BottomNavigationBarType.fixed,
      ),
      // s trailing comma makes auto-form
      floatingActionButton: _createMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // atting nicer for build methods.
    );
  }

  // 底部导航的每一项组件
  BottomNavigationBarItem bottomNavigationBarItem(String key, String value) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/icons/$key.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/icons/$key.png',
        width: 24,
        height: 24,
      ),
      label: value,
      tooltip: '', // 关闭按钮文字提示
    );
  }

  // 底部导航切换
  void _onTabClick(int index) {
    // 如果触发到第三个按钮就执行自定义的触发方法
    if (index == 1) {
      return _onCreateMedia();
    }
    // 会重新执行build函数 类似于重新渲染
    setState(() {
      _currentIndex = index;
    });
  }

  // 手机图标按钮
  Widget _createMediaButton() {
    return Container(
      width: 48,
      height: 48,
      margin: EdgeInsets.only(top: 56),
      child: FloatingActionButton(
        backgroundColor: AppColors.nav,
        child: Image.asset(
          'assets/icons/shouji.png',
        ),
        onPressed: _onCreateMedia,
      ),
    );
  }

  // 点击手机图标按钮
  void _onCreateMedia() {
    // print('_onCreateMedia');
    // HomeService.getHomeTabNameList()
    //     .then((value) => print(value))
    //     .catchError((error) {
    //   print(error);
    // });
  }
}
