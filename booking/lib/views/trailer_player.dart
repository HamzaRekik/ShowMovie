import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dio/dio.dart';
import 'package:booking/services/movies_service.dart';

class MyVideoPlayer extends StatefulWidget {
  MyVideoPlayer({required this.movieID});

  final int movieID;

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late YoutubePlayerController _controller;

  Future<String> getMovieTrailer() async {
    try {
      var videoKey =
          await MoviesService(Dio()).getTrailer(movieID: widget.movieID);

      return videoKey;
    } catch (e) {
      print("Error fetching trailer: $e");
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getMovieTrailer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller = YoutubePlayerController(
            initialVideoId: snapshot.data ?? '',
            flags: const YoutubePlayerFlags(
              hideThumbnail: true,
              autoPlay: false,
              mute: false,
            ),
          );

          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              onReady: () => SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.manual,
                  overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]),
              onEnded: (metaData) {
                _controller.toggleFullScreenMode();
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
              },
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.deepPurple,
            ),
            builder: (context, player) {
              return player;
            },
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ));
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
