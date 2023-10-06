class User {
  static String? objectId;
  static String? username;
  static String? createdAt;
  static String? updatedAt;
  static String? sessionToken;

  User.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['username'] = username;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['sessionToken'] = sessionToken;

    return data;
  }
}

class UserId {
  String? sType;
  String? className;

  UserId({this.sType, this.className});

  UserId.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__type'] = sType;
    data['className'] = className;
    return data;
  }
}
