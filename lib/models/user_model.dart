class UserModel {
  String? name;
  String? telephone;
  String? email;
  String? hobi;
  String? pekerjaan;
  String? uid;

  UserModel({
    this.name,
    this.telephone,
    this.email,
    this.hobi,
    this.pekerjaan,
    this.uid,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    telephone = json['telephone'];
    email = json['email'];
    hobi = json['hobi'];
    pekerjaan = json['pekerjaan'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'telephone': telephone,
      'email': email,
      'hobi': hobi,
      'pekerjaan': pekerjaan,
      'uid': uid,
    };
  }
}
