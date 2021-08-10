import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/avatar_role_name.dart';
import 'package:flutter_app/view/components/comment_like_read.dart';

class TinyVideoCard extends StatelessWidget {
  const TinyVideoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cover(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: AvatarRoleName(
            nickname: '管理员',
            avatarUrl: 'https://agoodman.club/upload/2020/12/avatar-376a34a5787b473dacb0f488e19cc82c.jpg',
            type: 'ADMIN',
            showType: true,
          ),
        ),
        CommentLikeRead(
          commentCount: 10,
          readCount: 10,
          thumbUpCount: 10,
        ),
      ],
    );
  }

  /// 封面
  Widget _cover() {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/zhanwei.jpg',
              image: 'https://agoodman.club/upload/2020/12/avatar-376a34a5787b473dacb0f488e19cc82c.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/icons/bofang.png',
              width: 38,
              height: 38,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
