import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/song_card.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SongPage extends StatefulWidget {
  SongPage({Key? key}) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
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
              SongCard(),
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
