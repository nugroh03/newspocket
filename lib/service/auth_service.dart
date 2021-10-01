import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_newspocket/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserModel> addUser(String name, String email, String telephone,
      String password, String hobi, String pekerjaan) async {
    try {
      UserModel user1 = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User user = _firebaseAuth.currentUser!;
        //print('auth' + user.toString());

        var newget = await firestore.collection("users").doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'email': email,
          'hobi': hobi,
          'pekerjaan': pekerjaan,
          'telephone': telephone,
        }).then((value) async {
          var datauser =
              await firestore.collection('users').doc(user.uid).get();

          UserModel users = UserModel.fromJson(datauser.data()!);

          // print(_user.toString());
          return users;
        });

        return newget;
      });
      print('user1' + user1.toString());
      return user1;
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim');
    }
  }

  Future<UserModel> getuser(String email, String password) async {
    try {
      UserModel userr = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User user = _firebaseAuth.currentUser!;
        var datauser = await firestore.collection('users').doc(user.uid).get();
        print('data1 ' + datauser.data().toString());

        UserModel users = UserModel.fromJson(datauser.data()!);

        // print(_user.toString());

        print('data ' + users.name.toString());
        return users;
      });
      print('data' + userr.name.toString());
      return userr;
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim');
    }
  }
}
