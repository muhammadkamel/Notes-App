class UserModel {
  String? username;
  String? password;
  String? email;
  String? imageAsBase64;
  String? intrestId;
  String? id;

  UserModel.toJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    imageAsBase64 = json['imageAsBase64'];
    intrestId = json['intrestId'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
      "email": email,
      "imageAsBase64": imageAsBase64,
      "intrestId": intrestId,
      "id": id
    };
  }
}
