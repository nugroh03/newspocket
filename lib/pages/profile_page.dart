import 'package:final_project_newspocket/constans.dart';
import 'package:final_project_newspocket/models/user_model.dart';
import 'package:final_project_newspocket/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider users = Provider.of<UserProvider>(context);
    UserModel user = users.newuser!;

    void alert() async {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Yakin anda ingin keluar ?'),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Tidak',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text(
                    'Ya',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _signOut().then((value) =>
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false));
                  },
                ),
              ],
            );
          });
    }

    Widget logOut() {
      return Container(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: fourthColor),
            onPressed: () {
              alert();
            },
            child: Text(
              'Keluar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: thirdColor,
              ),
            )),
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: fourthColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              user.name!,
              style: TextStyle(fontSize: 25, fontWeight: bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              user.telephone!,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hobi',
                    style: TextStyle(fontSize: 20, fontWeight: bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.hobi!,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 20, fontWeight: bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pekerjaan',
                    style: TextStyle(fontSize: 20, fontWeight: bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.pekerjaan!,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            logOut()
          ],
        ),
      ),
    );
  }
}
