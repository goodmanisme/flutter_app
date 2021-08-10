/// 用户模型
class UserItem {
  final int id;
  final String avatarUrl;
  final String nickname;
  final String roleType;

  UserItem(this.id, this.avatarUrl, this.nickname, this.roleType);

  UserItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        avatarUrl = json['avatarUrl'],
        nickname = json['nickname'],
        roleType = json['roleType'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'avatarUrl': avatarUrl,
        'nickname': nickname,
        'roleType': roleType,
      };
}

/// 用户模型列表
class UserList {
  final List<UserItem> list;

  UserList(this.list);

  factory UserList.fromJson(List<dynamic> list) {
    return UserList(
      list.map((model) => UserItem.fromJson(model)).toList(),
    );
  }
}
