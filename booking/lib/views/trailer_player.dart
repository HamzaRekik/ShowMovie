import 'package:booking/services/movies_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoPlayer extends StatefulWidget {
  MyVideoPlayer({required this.movieID});

  final int movieID;

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late final YoutubePlayerController _controller;
  Future<String> getMovieTrailer() async {
    var videoKey =
        await MoviesService(Dio()).getTrailer(movieID: widget.movieID);

    return videoKey;
  }

  init() async {
    try {
      final key = await getMovieTrailer();
      _controller = YoutubePlayerController(
        initialVideoId: key,
        flags: const YoutubePlayerFlags(
          hideThumbnail: true,
          autoPlay: false,
          mute: false,
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.deepPurple,
        // onReady: () {
        //   _controller.toggleFullScreenMode();
        // },
        // onEnded: (metaData) => Navigator.pop(context),
      ),
      builder: (context, player) {
        return player;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
