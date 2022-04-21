import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Stories extends StatefulWidget {
  final dynamic stories;

  Stories({Key key, @required this.stories}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  List<StoryItem> items = List();

  @override
  void initState() {
    super.initState();
  }

  final storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        margin: EdgeInsets.all(
          0,
        ),
        child: StoryView(
          storyItems: [
            StoryItem.pageVideo(widget.stories['video_url'],
                controller: storyController,
                caption: widget.stories['titre'],
                duration: Duration(milliseconds: 30000)),
          ],
          onStoryShow: (s) {
            print("Showing a story");
          },
          onComplete: () {
            print("Completed a cycle");
          },
          progressPosition: ProgressPosition.top,
          repeat: false,
          controller: storyController,
        ),
      ),
    );
  }
}
