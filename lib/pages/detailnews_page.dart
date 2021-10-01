import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_newspocket/constans.dart';
import 'package:final_project_newspocket/models/news_model.dart';
import 'package:final_project_newspocket/provider/bookmark_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DetailsNewsPage extends StatefulWidget {
  DetailsNewsPage({Key? key, this.newsModel}) : super(key: key);

  final NewsModel? newsModel;

  @override
  _DetailsNewsPageState createState() => _DetailsNewsPageState();
}

class _DetailsNewsPageState extends State<DetailsNewsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    BookmarkProvider bookmarkProvider = Provider.of<BookmarkProvider>(context);

    Widget header() {
      return CachedNetworkImage(
        imageUrl: widget.newsModel!.urlToImage!,
        imageBuilder: (context, imageProvider) => Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 225.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(30),
            child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Detail News',
                    style: TextStyle(fontWeight: bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(40)),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            header(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: width,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    color: fourthColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: width - (40),
                        child: Text(
                          widget.newsModel!.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Icon(Icons.bookmark, size: 30, color: secondaryColor),

                          GestureDetector(
                              onTap: () {
                                bookmarkProvider.setBookmark(widget.newsModel!);

                                if (bookmarkProvider
                                    .isBookmark(widget.newsModel!)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: thirdColor,
                                      content: Text(
                                        'Berita berhasil di tambahkan ke Bookmark',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Text(
                                        'Berita berhasil di hapus dari Bookmark',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    bookmarkProvider
                                            .isBookmark(widget.newsModel!)
                                        ? Icons.bookmarks
                                        : Icons.bookmarks_outlined,
                                    color: thirdColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Bookmark',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              )),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    widget.newsModel!.author!,
                                    maxLines: 2,
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Author',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          widget.newsModel!.content!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
