import 'package:final_project_newspocket/pages/bookmark_page.dart';
import 'package:final_project_newspocket/pages/homescreen_page.dart';
import 'package:final_project_newspocket/pages/news_page.dart';

import 'package:final_project_newspocket/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentTab = 0;
  PageController pageController = PageController();

  String? news = 'News';

  @override
  void initState() {
    super.initState();
    _currentTab = 0;
    pageController = PageController(initialPage: _currentTab);
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreenPage();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Yakin anda ingin keluar'),
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
          }),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentTab = index;
            });
          },
          children: [
            HomeScreenPage(
              newsPageHeadline: () async {
                setState(() {
                  news = 'Headline';
                });
                _currentTab = 1;
                pageController.jumpToPage(1);
              },
              newsPage: () async {
                setState(() {
                  news = 'News';
                });
                _currentTab = 1;
                pageController.jumpToPage(1);
              },
            ),
            NewsPage(
              news: news,
            ),
            BookmarkPage(
              homepage: () async {
                _currentTab = 0;
                pageController.jumpToPage(0);
              },
            ),
            ProfilePage()
          ],
        ),

        //PageStorage(bucket: bucket, child: currentScreen),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            child: BottomAppBar(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  news = 'News';
                                });
                                _currentTab = 0;
                                pageController.jumpToPage(0);
                              });
                            },
                            minWidth: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: _currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                Text('Home')
                              ],
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                _currentTab = 1;
                                pageController.jumpToPage(1);
                              });
                            },
                            minWidth: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book,
                                  color: _currentTab == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                Text('News')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _currentTab = 2;
                                  pageController.jumpToPage(2);
                                });
                              },
                              minWidth: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bookmark,
                                    color: _currentTab == 2
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  Text('Bookmark')
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _currentTab = 3;
                                  pageController.jumpToPage(3);
                                });
                              },
                              minWidth: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: _currentTab == 3
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  Text('profile')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
