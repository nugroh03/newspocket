import 'package:final_project_newspocket/pages/login_page.dart';
import 'package:final_project_newspocket/pages/navigation.dart';
import 'package:final_project_newspocket/pages/onboarding_page.dart';

import 'package:final_project_newspocket/pages/signup_page.dart';
import 'package:final_project_newspocket/pages/splash_page.dart';
import 'package:final_project_newspocket/provider/bookmark_provider.dart';
import 'package:final_project_newspocket/provider/news_provider.dart';
import 'package:final_project_newspocket/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkProvider(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => SplashPage(),
        '/onboarding': (context) => OnBoardingPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => NavigationPage()
      }),
    );
  }
}
