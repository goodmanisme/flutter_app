import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/util.dart';
import 'package:flutter_app/view/config/app_colors.dart';

/// 点赞评论转发相关组件
class CommentLikeRead extends StatelessWidget {
  final int commentCount;
  final int readCount;
  final int thumbUpCount;

  const CommentLikeRead({
    Key? key,
    required this.commentCount,
    required this.readCount,
    required this.thumbUpCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _iconText('assets/icons/dianzan.png', commentCount),
        _iconText('assets/icons/comment.png', thumbUpCount),
        _iconText('assets/icons/zhuanfa.png', readCount),
      ],
    );
  }

  /// 图标文本组件
  Widget _iconText(String icon, int count) {
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 18,
            height: 18,
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              formatCharCount(count),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.negative3,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
