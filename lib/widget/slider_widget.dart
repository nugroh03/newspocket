import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? content;

  SliderWidget({this.image, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //constraints: BoxConstraints(minHeight: 200, maxHeight: 450),
            height: 450,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image!)),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    bottomRight: Radius.circular(20))),
            //child: Image.asset(image!, fit: BoxFit.cover),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  content!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
