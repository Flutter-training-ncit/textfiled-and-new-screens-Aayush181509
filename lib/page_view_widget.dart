import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.white,
    Colors.blueGrey,
    Colors.amber,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          pageController.animateToPage(3,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          //// never scrollable physics makes the list view un scrollable
          // physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            print(index.toString());
          },
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Container(
              color: colors[index],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    index.toString(),
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    colors[index].toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            );
          },

          // children: [
          //   Container(color: Colors.green),
          //   Container(color: Colors.red),
          //   Container(color: Colors.pink),
          //   Container(color: Colors.black),
          //   Container(color: Colors.white),
          // ],
        ),
      ),
    );
  }
}
