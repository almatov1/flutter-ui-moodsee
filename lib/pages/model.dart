import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodsee/pages/home.dart';
import 'package:moodsee/pages/profile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('MoodSee'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.menu),
          ),
        ],
      ),*/
      body: IndexedStack(
        index: pageViewIndex,
        children: <Widget>[
          HomePage(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageViewIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black87,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) => setState(() => pageViewIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
