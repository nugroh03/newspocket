import 'package:final_project_newspocket/constans.dart';

import 'package:final_project_newspocket/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isShow = true;
  bool isLoading = false;
  showPass() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    UserProvider authProvider = Provider.of<UserProvider>(context);

    Widget signin() {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color(0xff1F7FEF)),
          onPressed: () async {
            setState(() {
              isLoading = true;
            });

            if (await authProvider.login(
              email: _emailController.text,
              password: _passwordController.text,
            )) {
              Navigator.pushNamed(context, '/home');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red[100],
                  content: Text('Gagal Login!', textAlign: TextAlign.center),
                ),
              );
            }

            setState(() {
              isLoading = false;
            });
          },
          child: Text('MASUK'));
    }

    Widget inputlogin() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Container(
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: 'Masukkan Email',
                  hintStyle: TextStyle(fontSize: 16),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xffC3C3C3),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xffC3C3C3),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Container(
              child: TextFormField(
                obscureText: isShow,
                controller: _passwordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: 'Masukkan Password',
                  suffixIcon: InkWell(
                    onTap: () {
                      showPass();
                    },
                    child: Icon(
                      isShow
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: thirdColor,
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: 16),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xffC3C3C3),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xffC3C3C3),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 85,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News\nPocket',
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 100,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Login untuk dapat membaca berita',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              inputlogin(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Lupa password ?',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                child: Center(
                    child: isLoading
                        ? Container(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(thirdColor),
                            ),
                          )
                        : signin()),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: width - 60,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun? Klik ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: Text(
                        'Daftar ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff1F7FEF),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
