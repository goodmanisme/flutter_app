import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/article_card.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _easyRefreshController,
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 16,
              ),
              ArticleCard(),
            ],
          );
        },
      ),
    );
  }

  // 下拉刷新
  Future<void> _onRefresh() async {
    await _gettest();
    _easyRefreshController.finishRefreshCallBack!(noMore: true, success: true);
  }

  // 上拉加载
  Future<void> _onLoad() async {
    await _gettest();
    _easyRefreshController.finishLoadCallBack!(noMore: false, success: true);
  }

  _gettest() {
    print("加载");
  }
}
