import 'package:flutter/material.dart';
import 'package:video_conference_app/components/AccueilPage1.dart';
import 'package:video_conference_app/components/AccueilPage2.dart';
import 'package:video_conference_app/components/AccueilPage3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: <Widget>[
              AccueilPage1(),
              AccueilPage2(),
              AccueilPage3(),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _indicator(_currentPageIndex == 0),
                _indicator(_currentPageIndex == 1),
                _indicator(_currentPageIndex == 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: 10,
      width: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isActive ? Colors.blue : const Color.fromARGB(255, 195, 193, 193),
      ),
    );
  }
}
