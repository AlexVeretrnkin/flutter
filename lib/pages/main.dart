import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobile_app_flutter/components/preview-list.dart';
import 'package:mobile_app_flutter/enum/option.dart';
import 'package:mobile_app_flutter/models/preview-item.dart';

import 'package:mobile_app_flutter/models/screen-arguments.dart';
import 'package:mobile_app_flutter/providers/preview-item-provider.dart';
import 'package:provider/provider.dart';

import 'library-screen.dart';

List<PreviewItem> sectionData = [
  PreviewItem.image(
      'https://i.pinimg.com/originals/f7/3a/5b/f73a5b4b7262440684a2b5c39e684304.jpg'),
  PreviewItem.image('https://miro.medium.com/max/2800/0*xMaFF2hSXpf_kIfG.jpg'),
  PreviewItem.image('https://andro-news.com/images/content/youtubemusic1.jpg',
      width: 200)
];

List<PreviewItem> sectionVideoData = [
  PreviewItem.video(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
  PreviewItem.video(
      'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4'),
  PreviewItem.video(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
];

class MainScreen extends StatelessWidget {
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => LibraryScreen()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => SizedBox.expand(
          child: Container(
        color: Color.fromARGB(255, 25, 19, 8),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Consumer<PreviewItemProvider>(
                  builder: (context, cart, child) {
                return Column(
                  children: [
                    Text('totalLikes: ' + cart.totalLikes.toString()),
                    Text('totalDislikes: ' + cart.totalLDislikes.toString())
                  ],
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Your favorites',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  PreviewList(sectionData, height: 140),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your favorite music videos',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  PreviewList(sectionVideoData, height: 100),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LISTEN AGAIN',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            'Your evening music',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  PreviewList(sectionData, height: 140),
                ],
              ),
            ),
            FlatButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              child: Text('_navigateAndDisplaySelection'),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/second',
                arguments: ScreenArguments(
                  'Extract Arguments Screen',
                  'This message is extracted in the build method.',
                ),
              ),
              child: Image.network(
                'https://picsum.photos/250?image=9',
              ),
            ),
            MaterialButton(
              child: Text('Menu'),
              onPressed: () => Navigator.pushNamed(context, '/menu'),
            ),
          ],
        ),
      )),
    );
  }
}
