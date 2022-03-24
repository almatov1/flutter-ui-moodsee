import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('nickname '),
            Icon(Icons.account_circle_outlined),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'http://i.pinimg.com/originals/df/5f/e5/df5fe55a6161004d2198d764eeda441e.jpg',
                  ),
                  radius: 50,
                ),
                Text(
                  '\nSubs: 50 / Likes: 250 / Posts: 25\n\n',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox.expand(
                  child: Image.network(
                      'http://s9.favim.com/orig/131009/beautiful-cute-flowers-hipster-Favim.com-981863.jpg'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
