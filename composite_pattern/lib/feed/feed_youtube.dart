import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:composite_pattern/feed/feed.dart';

class FeedYoutube extends Feed {
  final String text;
  final String videoId;
  final YoutubePlayerController _controller;

  FeedYoutube({
    required this.text,
    required this.videoId,
  })  : _controller = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(autoPlay: false)),
        super(text: text);

  @override
  Widget renderContent() {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        super.renderContent()
      ],
    );
  }
}
