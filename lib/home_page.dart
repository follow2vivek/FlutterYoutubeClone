import 'package:flutter/material.dart';
import './tab_view/library.dart';
import './tab_view/inbox.dart';
import './tab_view/trending.dart';
import './tab_view/subscription.dart';
import './tab_view/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _children = [
    Home(),
    Trending(),
    Subscription(),
    Inbox(),
    Library()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/youtube_logo.png',
              width: 100.0,
            )
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.grey[500],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey[500],
            ),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              radius: 12.0,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.white,
              title: Text(
                "Home",
                style: textStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              backgroundColor: Colors.white,
              title: Text(
                "Trending",
                style: textStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              backgroundColor: Colors.white,
              title: Text(
                "Subscription",
                style: textStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              backgroundColor: Colors.white,
              title: Text(
                "Inbox",
                style: textStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              backgroundColor: Colors.white,
              title: Text(
                "Library",
                style: textStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  final textStyle = TextStyle(
    fontSize: 12.0,
  );
}
