import 'package:final_project_newspocket/provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInit();
    getHeadlineNews();
  }

  getInit() async {
    await Provider.of<NewsProvider>(context, listen: false).getNews();
  }

  getHeadlineNews() async {
    await Provider.of<NewsProvider>(context, listen: false).getheadlinenews();
    Navigator.pushNamed(context, '/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 100,
        ),
      ),
    );
  }
}
