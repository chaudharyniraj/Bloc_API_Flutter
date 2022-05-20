// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeTrailerWidget extends StatefulWidget {
  final String? yt_trailer_code;
  const YoutubeTrailerWidget({Key? key, required this.yt_trailer_code})
      : super(key: key);

  @override
  State<YoutubeTrailerWidget> createState() => _YoutubeTrailerWidgetState();
}

class _YoutubeTrailerWidgetState extends State<YoutubeTrailerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Container(
            color: Colors.black,
            child: Center(
              child: player,
            ),
          );
        });
  }

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId("${widget.yt_trailer_code}")!,
        flags: const YoutubePlayerFlags(
            autoPlay: true,
            enableCaption: false,
            isLive: false,
            forceHD: false));
  }
}
