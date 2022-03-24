import 'package:flutter/material.dart';
import 'package:moodsee/widgets/videoWidget.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'comments.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  late PreloadPageController pageController;
  Color _colorContainer = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PreloadPageController(
      initialPage: 0,
      viewportFraction: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreloadPageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        controller: pageController,
        preloadPagesCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              VideoWidget(
                url: 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/3.mp4?alt=media&token=a7ccda22-7264-4c64-9328-86a4c2ec31cd',
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.people),
                          label: Text('986'),
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _colorContainer =
                              _colorContainer == Colors.white
                                  ? Colors.purple
                                  : Colors.white;
                            });
                          },
                          icon: Icon(Icons.favorite),
                          label: Text('367'),
                          style: TextButton.styleFrom(
                            primary: _colorContainer,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondRoute(
                                  name: 'Comments',
                                  pass: '123',
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.chat),
                          label: Text('98'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Text(
                        'Author - ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Subscribe',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
