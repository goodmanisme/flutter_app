import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/user_type.dart';
import 'package:flutter_app/view/config/app_colors.dart';

/// 头像角色昵称组件
class AvatarRoleName extends StatelessWidget {
  final String nickname;
  final String avatarUrl;
  final String type;

  final bool showType;

  /// 头像角色组件构造函数
  const AvatarRoleName({
    Key? key,
    required this.nickname,
    required this.avatarUrl,
    required this.type,
    this.showType = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _avatar(),
        Offstage(
          offstage: !showType, // 是否隐藏
          child: _role(),
        ),
        _nickname(),
      ],
    );
  }

  /// 头像组件
  Widget _avatar() {
    return SizedBox(
      width: 20,
      height: 20,
      child: ClipOval(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/zhanwei.jpg', // 占位图
          image: avatarUrl, // 网络图片地址
        ),
      ),
    );
  }

  /// 角色组件
  Widget _role() {
    return Container(
      margin: EdgeInsets.only(left: 6),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        color: UserType.formColor(type),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        UserType.formCn(type),
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }

  /// 昵称组件
  Widget _nickname() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(
          nickname,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.negative1,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
