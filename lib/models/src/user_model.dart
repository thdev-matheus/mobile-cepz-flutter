class UserModel {
  static String? objectId;
  static String? username;
  static String? password;
  static String? createdAt;
  static String? updatedAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['objectId'] = objectId;
    data['username'] = username;
    data['password'] = password;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}

class Owner {
  static String sType = "Pointer";
  static String className = "_User";
  static String? objectId = UserModel.objectId;

  Owner();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['__type'] = sType;
    data['className'] = className;
    data['objectId'] = objectId;

    return data;
  }
}
