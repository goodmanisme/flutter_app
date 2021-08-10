import 'package:flutter_app/src/http/http_client.dart';
import 'package:flutter_app/src/http/http_response.dart';
import 'package:flutter_app/src/model/menu_list.dart';

/// 主页数据层
class HomeService {

  // 地址前缀
  static const String BASE_URL = 'http://127.0.0.1:8087';

  /// 主页tab数据
   static Future<MenuList> getHomeTabNameList() async {
     /// todo 请求接口调试
    HttpResponse response = await HttpClient().get("$BASE_URL/menu/homeTabList");
    MenuList menuList = MenuList.fromJson(response.data);
    return menuList;
  }

}
