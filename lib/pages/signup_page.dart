import 'package:final_project_newspocket/constans.dart';
import 'package:final_project_newspocket/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _noTelephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();
  final TextEditingController _pekerjaanController = TextEditingController();
  bool isShow = true;

  bool isLoading = false;
  showPass1() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    UserProvider authProvider = Provider.of<UserProvider>(context);

    Widget header() {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              'Daftar',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'untuk dapat membaca berita',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Container(
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: 'Masukkan Nama Lengkap',
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
              height: 12,
            ),
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
              height: 12,
            ),
            Text(
              'Nomor Telephone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Container(
              child: TextFormField(
                controller: _noTelephoneController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: 'Masukkan Nomor Telephone',
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
              height: 12,
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
                  hintStyle: TextStyle(fontSize: 16),
                  suffixIcon: InkWell(
                    onTap: () {
                      showPass1();
                    },
                    child: Icon(
                      isShow
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: thirdColor,
                    ),
                  ),
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
              height: 12,
            ),
            Text(
              'Hobi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Container(
              child: TextFormField(
                controller: _hobiController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: 'Masukkan Hobi',
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
              height: 12,
            ),
            Text(
              'Pekerjaan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Container(
              child: TextFormField(
                controller: _pekerjaanController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: 'Masukkan Pekerjaan',
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

    Widget signup() {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color(0xff1F7FEF)),
          onPressed: () async {
            setState(() {
              isLoading = true;
            });

            if (await authProvider.register(
                name: _nameController.text,
                email: _emailController.text,
                telephone: _noTelephoneController.text,
                password: _passwordController.text,
                hobi: _hobiController.text,
                pekerjaan: _pekerjaanController.text)) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red[100],
                  content: Text('Gagal Daftar!', textAlign: TextAlign.center),
                ),
              );
            }

            setState(() {
              isLoading = false;
            });
          },
          child: Text('DAFTAR'));
    }

    Widget signin() {
      return Container(
        width: width - 60,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah memiliki akun ? Klik ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Text(
                'Masuk ',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff1F7FEF),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: -50,
              bottom: 50,
              child: Image.asset('assets/bgsignup.png',
                  height: 550,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  colorBlendMode: BlendMode.modulate),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  header(),
                  content(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Center(
                        child: isLoading
                            ? Container(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                      AlwaysStoppedAnimation(thirdColor),
                                ),
                              )
                            : signup()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  signin(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
