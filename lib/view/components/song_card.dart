import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/util.dart';
import 'package:flutter_app/view/components/avatar_role_name.dart';
import 'package:flutter_app/view/components/comment_like_read.dart';
import 'package:flutter_app/view/config/app_colors.dart';

/// 音乐卡片组件
class SongCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(toRpx(context, 40)),
      child: Row(
        children: [
          _songCover(),
          SizedBox(
            width: 10,
          ),
          _songContent(),
        ],
      ),
    );
  }

  /// 音乐内容组件
  Widget _songContent() {
    return Expanded(
      child: SizedBox(
        height: 75,
        child: Stack(
          children: [
            Text(
              '标题',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.active, fontSize: 16),
            ),
            Positioned(
              top: 25,
              child: Text(
                '副标题',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.negative3,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: AvatarRoleName(
                      nickname: '昵称',
                      avatarUrl: 'https://agoodman.club/upload/2020/12/avatar-376a34a5787b473dacb0f488e19cc82c.jpg',
                      type: 'ADMIN',
                      showType: true ,
                    ),
                  ),
                  Expanded(
                    child: CommentLikeRead(
                      commentCount: 123123,
                      thumbUpCount: 123123,
                      readCount: 123123,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 封面
  Widget _songCover() {
    return SizedBox(
      width: 75,
      height: 75,
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
              width: 22,
              height: 22,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
