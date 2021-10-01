import 'package:final_project_newspocket/constans.dart';
import 'package:final_project_newspocket/provider/bookmark_provider.dart';
import 'package:final_project_newspocket/widget/bookmark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  BookmarkPage({Key? key, this.homepage}) : super(key: key);

  final Function? homepage;
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    BookmarkProvider bookmarkProvider = Provider.of<BookmarkProvider>(context);

    Widget emptyBookmark() {
      return Expanded(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bookmark_remove,
                  size: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Anda belum memiliki bookmark',
                  style: TextStyle(fontSize: 22, fontWeight: bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Silahkan pilih berita terlebih dahulu!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: fourthColor),
                      onPressed: () async {
                        widget.homepage!();
                      },
                      child: Text(
                        'Berita',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: thirdColor,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          child: ListView(
              children: bookmarkProvider.bookmark
                  .map((item) => BookmarkWidget(
                        news: item,
                      ))
                  .toList()),
        ),
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
                        'Bookmark',
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
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: 20),
          child: Column(children: [
            bookmarkProvider.bookmark.length == 0 ? emptyBookmark() : content()
          ])),
    );
  }
}
