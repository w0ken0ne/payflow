import 'dart:convert';

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, required this.photoURL});

  Map<String, dynamic> toMap() => {"name": name, "photoURL": photoURL};
  String toJSON() => jsonEncode(toMap());
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoURL: map['photoURL']);
  }
  factory UserModel.fromJSON(String json) =>
      UserModel.fromMap(jsonDecode(json));
}
