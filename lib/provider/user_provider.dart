import 'package:final_project_newspocket/models/user_model.dart';
import 'package:final_project_newspocket/service/auth_service.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  UserModel? _users;
  UserModel? _newuser;

  UserModel? get users => _users;
  UserModel? get newuser => _newuser;

  set users(UserModel? user) {
    _users = user;
    notifyListeners();
  }

  set newuser(UserModel? newuser) {
    _newuser = newuser;
    notifyListeners();
  }

  Future<bool> register(
      {String? name,
      String? email,
      String? telephone,
      String? password,
      String? hobi,
      String? pekerjaan}) async {
    try {
      UserModel? user = await AuthService()
          .addUser(name!, email!, telephone!, password!, hobi!, pekerjaan!);

      _newuser = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String? email, String? password}) async {
    try {
      UserModel? user = await AuthService().getuser(
        email!,
        password!,
      );
      _newuser = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
