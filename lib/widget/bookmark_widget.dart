import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_newspocket/constans.dart';
import 'package:final_project_newspocket/models/news_model.dart';
import 'package:final_project_newspocket/pages/detailnews_page.dart';
import 'package:final_project_newspocket/provider/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({Key? key, this.news}) : super(key: key);

  final NewsModel? news;

  @override
  Widget build(BuildContext context) {
    BookmarkProvider bookmarkProvider = Provider.of<BookmarkProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsNewsPage(
                      newsModel: news,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: news!.urlToImage!,
              imageBuilder: (context, imageProvider) => Container(
                width: 100.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // Container(
            //   height: 80,
            //   width: 100,
            //   decoration: BoxDecoration(
            //       color: thirdColor,
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(15),
            //     bottomLeft: Radius.circular(15)),
            //       image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: NetworkImage(news!.urlToImage!))),
            // ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: primaryColor, fontWeight: bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          news!.author ?? 'Author',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: secondaryColor,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              bookmarkProvider.setBookmark(news!);

                              if (bookmarkProvider.isBookmark(news!)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.blueAccent,
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
                            child: Icon(
                              bookmarkProvider.isBookmark(news)
                                  ? Icons.bookmarks
                                  : Icons.bookmarks_outlined,
                              color: thirdColor,
                            )

                            // Image.asset(
                            //     wishlistProvider.isWishlist(widget.product!)
                            //         ? 'assets/button_wishlist_blue.png'
                            //         : 'assets/button_wishlist.png',
                            //     width: 46),

                            ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
