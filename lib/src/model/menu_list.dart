class MenuList {
  List<MenuItem>? menuItem;

  MenuList({
      this.menuItem});

  MenuList.fromJson(dynamic json) {
    if (json['MenuItem'] != null) {
      menuItem = [];
      json['MenuItem'].forEach((v) {
        menuItem?.add(MenuItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (menuItem != null) {
      map['MenuItem'] = menuItem?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class MenuItem {
  int? id;
  int? parentId;
  String? path;
  String? menuName;
  String? creator;

  MenuItem({
      this.id, 
      this.parentId, 
      this.path, 
      this.menuName, 
      this.creator});

  MenuItem.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parentId'];
    path = json['path'];
    menuName = json['menuName'];
    creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['parentId'] = parentId;
    map['path'] = path;
    map['menuName'] = menuName;
    map['creator'] = creator;
    return map;
  }

}
