import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_newspocket/constans.dart';
import 'package:final_project_newspocket/models/news_model.dart';
import 'package:final_project_newspocket/pages/detailnews_page.dart';
import 'package:flutter/material.dart';

class HeadlineSlideWidget extends StatelessWidget {
  const HeadlineSlideWidget({Key? key, this.headline}) : super(key: key);

  final NewsModel? headline;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsNewsPage(
                      newsModel: headline,
                    )));
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: headline!.urlToImage!,
              imageBuilder: (context, imageProvider) => Container(
                width: 180.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(30),
                  child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                headline!.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
