import 'package:final_project_newspocket/constans.dart';
import 'package:final_project_newspocket/provider/news_provider.dart';
import 'package:final_project_newspocket/widget/newslist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key, this.news}) : super(key: key);

  final String? news;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    NewsProvider newsProvider = Provider.of<NewsProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 225,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            color: thirdColor, borderRadius: BorderRadius.circular(15)),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            height: 70,
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.news!,
                        style: TextStyle(fontWeight: bold, fontSize: 22),
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
              ],
            ),
          ),
          preferredSize: Size.fromHeight(70)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (widget.news == 'Headline')
                  ? newsProvider.headline
                      .map((item) => NewsList(
                            news: item,
                          ))
                      .toList()
                  : newsProvider.news
                      .map((item) => NewsList(
                            news: item,
                          ))
                      .toList()),
        ),
      ),
    );
  }
}
