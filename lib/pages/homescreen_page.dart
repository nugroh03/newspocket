import 'package:final_project_newspocket/constans.dart';

import 'package:final_project_newspocket/provider/news_provider.dart';
import 'package:final_project_newspocket/provider/user_provider.dart';
import 'package:final_project_newspocket/widget/headlineslide.dart';
import 'package:final_project_newspocket/widget/newslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key? key, this.newsPageHeadline, this.newsPage})
      : super(key: key);

  final VoidCallback? newsPageHeadline;
  final VoidCallback? newsPage;

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    NewsProvider newsProvider = Provider.of<NewsProvider>(context);

    PreferredSizeWidget appbar() {
      return PreferredSize(
          child: Container(
            height: 70,
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Hello, ',

                      //'Nur',
                      style: TextStyle(fontSize: 18, fontWeight: bold),
                    ),
                    Text(
                      user.newuser!.name!,

                      //'Nur',
                      style: TextStyle(fontSize: 18, fontWeight: bold),
                    )
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(80));
    }

    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apa yang ingin\nAnda baca hari ini?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    Widget headline() {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Headline News',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () async {
                      widget.newsPageHeadline!();
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(fontSize: 16, color: thirdColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                    children: newsProvider.headline
                        .map((item) => HeadlineSlideWidget(
                              headline: item,
                            ))
                        .toList()),
              ),
            )
          ],
        ),
      );
    }

    Widget contentNews() {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () async {
                      widget.newsPage!();
                    },
                    child: Text(
                      ' See All',
                      style: TextStyle(fontSize: 16, color: thirdColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  children: newsProvider.news
                      .map((item) => NewsList(
                            news: item,
                          ))
                      .toList()),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              header(),
              SizedBox(
                height: 27,
              ),
              headline(),
              SizedBox(
                height: 20,
              ),
              contentNews(),
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
