import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoWidget extends StatefulWidget {
  final String url;

  VideoWidget({Key? key, required this.url}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController = new VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture =
        videoPlayerController.initialize().then((value) {
          videoPlayerController.setLooping(true);
          videoPlayerController.setVolume(1);
        });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: <Widget>[
              VisibilityDetector(
                onVisibilityChanged: (VisibilityInfo info) {
                  setState(() {
                    if (info.visibleFraction == 0) {
                      videoPlayerController.pause();
                    } else {
                      videoPlayerController.play();
                    }
                  });
                },
                key: Key('key'),
                child: SizedBox.expand(
                  child: VideoPlayer(videoPlayerController),
                ),
              ),
              if (videoPlayerController.value.isPlaying == false)
                Center(
                  child: Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              GestureDetector(
                onTap: () {
                  setState(
                        () {
                      if (videoPlayerController.value.isPlaying)
                        videoPlayerController.pause();
                      else
                        videoPlayerController.play();
                    },
                  );
                },
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Text(''),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}