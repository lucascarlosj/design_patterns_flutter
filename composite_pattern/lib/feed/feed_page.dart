import 'package:composite_pattern/feed/feed.dart';
import 'package:composite_pattern/feed/feed_image.dart';
import 'package:composite_pattern/feed/feed_youtube.dart';
import 'package:composite_pattern/feed/ifeed.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Ifeed> feed = [];

  @override
  void initState() {
    super.initState();
    feed.add(Feed(text: 'Enviando mensagem de texto'));
    feed.add(FeedImage(text: 'Enviando imagem', url: 'https://html.com/wp-content/uploads/flamingo.webp'));
    feed.add(FeedYoutube(text: 'Video', videoId: 'zHd4rSpZn48'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView.builder(
        itemCount: feed.length,
        itemBuilder: (BuildContext context, int index) => feed[index].render(),
      ),
    );
  }
}
