import 'package:final_project_newspocket/widget/slider_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List _page = [
    {
      'title': 'Baca Dimanapun',
      'image': 'assets/slide1.png',
      'content':
          'Anda dapat mengetahui informasi dimanapun dan kapanpun hanya dengan handphone',
    },
    {
      'title': 'Informasi Terbaru',
      'image': 'assets/slide2.png',
      'content': 'Dapatkan berita terbaru pada handphone anda',
    },
    {
      'title': 'Capai Target',
      'image': 'assets/slide3.png',
      'content':
          'Dengan membaca berita terbaru anda dapat menentukan langkah untuk mencapai targetmu ',
    },
  ];

  int _currentPage = 0;

  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _page.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return SliderWidget(
                  title: _page[index]['title'],
                  image: _page[index]['image'],
                  content: _page[index]['content']);
            }),
        bottomNavigationBar: PreferredSize(
            child: Container(
              height: 105,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                          List<Widget>.generate(_page.length, (int index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 6,
                          width: (index == _currentPage) ? 20 : 6,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Colors.black
                                  : Colors.grey),
                        );
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.035,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false);
                          },
                          child: (_currentPage <= 1)
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'SKIP',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey),
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.width * 0.25,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () {
                              print(_currentPage);
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOutQuint);

                              if (_currentPage == 2) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/login', (route) => false);
                              }
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(180)),
      ),
    );
  }
}
