import 'package:flutter/material.dart';
import 'package:flutter_app/view/config/app_colors.dart';

class SingerCard extends StatelessWidget {
  const SingerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/zhanwei.jpg',
              image: 'https://agoodman.club/upload/2020/12/avatar-376a34a5787b473dacb0f488e19cc82c.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            '用户',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.active,
              fontSize: 16,
            ),
          ),
        ),
        Row(
          children: [
            _iconText(),
            _iconText(),
          ],
        ),
      ],
    );
  }

  /// 图标组件
  Widget _iconText() {
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            'assets/icons/dianzan.png',
            width: 16,
            height: 16,
          ),
          Expanded(
            child: Text(
              '歌曲: 1.1w',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.negative1,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
