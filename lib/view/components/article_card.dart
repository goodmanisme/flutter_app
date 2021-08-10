import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/util.dart';
import 'package:flutter_app/view/components/avatar_role_name.dart';
import 'package:flutter_app/view/components/comment_like_read.dart';
import 'package:flutter_app/view/config/app_colors.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({Key? key}) : super(key: key);

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

const double paddingSize = 20; // padding
const double spaceSize = 10; // 间距

class _ArticleCardState extends State<ArticleCard> {
  late double boxSize; // 盒子大小

  @override
  Widget build(BuildContext context) {
    // 计算盒模型大小
    boxSize = MediaQuery.of(context).size.width - paddingSize * 2;
    return Container(
      padding: EdgeInsets.all(paddingSize),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 标题靠左
        children: [
          _title(),
          SizedBox(height: paddingSize),
          _getCoverByType(),
          SizedBox(height: paddingSize),
          _bottom(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "标题",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.active,
      ),
    );
  }

  Widget _cover({int index = 0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/zhanwei.jpg',
        image: 'https://agoodman.club/upload/2020/12/avatar-376a34a5787b473dacb0f488e19cc82c.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _bottom() {
    return Row(
      children: [
        // 包一层解决文字溢出
        Expanded(
          child: AvatarRoleName(
            nickname: '管理员',
            avatarUrl: 'https://agoodman.club/upload/2020/12/avatar-376a34a5787b473dacb0f488e19cc82c.jpg',
            type: "ADMIN",
          ),
        ),
        Expanded(
          child: CommentLikeRead(
            commentCount: 20,
            readCount: 29,
            thumbUpCount: 20,
          ),
        ),
      ],
    );
  }

  /// 图片随机排列方式
  /// 1张 > 1
  /// 2张 > 2,3
  /// 3张 > 2,3,4,5,6,7
  /// 4张 > 2,3,4,5,6,7,8
  /// 基于图片的数量获取图片的随机组合类型
  _getTypeByLength() {
    // 定义封面数量
    int length = 4;
    int coverType;
    switch (length) {
      case 2:
        coverType = getRandomRangeInt(2, 3);
        break;
      case 3:
        coverType = getRandomRangeInt(2, 7);
        break;
      case 4:
        coverType = getRandomRangeInt(2, 8);
        break;
      default:
        coverType = 1;
    }
    return coverType;
  }

  _getCoverByType() {
    int _coverType = _getTypeByLength();

    Widget _coverWidget;
    switch (_coverType) {
      case 2:
        _coverWidget = _cover2();
        break;
      case 3:
        _coverWidget = _cover3();
        break;
      case 4:
        _coverWidget = _cover4();
        break;
      case 5:
        _coverWidget = _cover5();
        break;
      case 6:
        _coverWidget = _cover6();
        break;
      case 7:
        _coverWidget = _cover7();
        break;
      case 8:
        _coverWidget = _cover8();
        break;
      default:
        _coverWidget = _cover1();
    }
    return _coverWidget;
  }

  /// 2张 排列方式一排两张
  Widget _cover1() {
    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: _cover(),
    );
  }

  /// 2张 排列方式一排两张
  Widget _cover2() {
    return Row(
      // 主轴间距
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: boxSize / 2 - spaceSize / 2,
          height: boxSize,
          child: _cover(index: 0),
        ),
        SizedBox(
          width: boxSize / 2 - spaceSize / 2,
          height: boxSize,
          child: _cover(index: 1),
        ),
      ],
    );
  }

  /// 2张 排列方式 两排两张
  Widget _cover3() {
    return Column(
      children: [
        SizedBox(
          height: boxSize / 2 - spaceSize / 2,
          width: boxSize,
          child: _cover(index: 0),
        ),
        SizedBox(height: spaceSize), // 上下间隔
        SizedBox(
          height: boxSize / 2 - spaceSize / 2,
          width: boxSize,
          child: _cover(index: 1),
        ),
      ],
    );
  }

  /// 2张 排列方式 两排两张
  Widget _cover4() {
    return Row(
      // 主轴间距
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: boxSize / 2 - spaceSize / 2,
          height: boxSize,
          child: _cover(index: 0),
        ),
        Column(
          children: [
            SizedBox(
              width: boxSize / 2 - spaceSize / 2,
              height: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 1),
            ),
            SizedBox(height: spaceSize), // 上下间隔
            SizedBox(
              width: boxSize / 2 - spaceSize / 2,
              height: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 1),
            ),
          ],
        ),
      ],
    );
  }

  /// 2张 排列方式 两排两张
  Widget _cover5() {
    return Row(
      // 主轴间距
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              width: boxSize / 2 - spaceSize / 2,
              height: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 1),
            ),
            SizedBox(height: spaceSize), // 上下间隔
            SizedBox(
              width: boxSize / 2 - spaceSize / 2,
              height: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 1),
            ),
          ],
        ),
        SizedBox(
          width: boxSize / 2 - spaceSize / 2,
          height: boxSize,
          child: _cover(index: 0),
        ),
      ],
    );
  }

  /// 2张 排列方式 两排两张
  Widget _cover6() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
          ],
        ),
        SizedBox(height: spaceSize), // 上下间隔
        SizedBox(
          height: boxSize / 2 - spaceSize / 2,
          width: boxSize,
          child: _cover(index: 1),
        ),
      ],
    );
  }

  /// 2张 排列方式 两排两张
  Widget _cover7() {
    return Column(
      children: [
        SizedBox(
          height: boxSize / 2 - spaceSize / 2,
          width: boxSize,
          child: _cover(index: 1),
        ),
        SizedBox(height: spaceSize), // 上下间隔
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
          ],
        ),
      ],
    );
  }

  /// 2张 排列方式 两排两张
  Widget _cover8() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
          ],
        ),
        SizedBox(height: spaceSize), // 上下间隔
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
            SizedBox(
              height: boxSize / 2 - spaceSize / 2,
              width: boxSize / 2 - spaceSize / 2,
              child: _cover(index: 0),
            ),
          ],
        ),
      ],
    );
  }
}
