import 'package:flutter/material.dart';

/// 我的页面头像组件
class MyAvatarCard extends StatelessWidget {
  const MyAvatarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        _buildCircleImg(),
        SizedBox(
          width: 25,
        ),
        Expanded(
          child: _buildCenter(),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 14,
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }

  /// 头像装饰
  Widget _buildCircleImg() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/zhanwei.jpg'),
        ),
      ),
    );
  }

  /// 构建中头像卡片中间内容
  Widget _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'AGoodMan',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '富强,明主,文明,和谐,公正,法制,爱国,敬业,诚信,友善',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
