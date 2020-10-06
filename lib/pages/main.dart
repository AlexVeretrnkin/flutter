import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app_flutter/components/previe-list-video-item.dart';
import 'package:mobile_app_flutter/components/preview-list.dart';
import 'package:mobile_app_flutter/models/preview-item.dart';

import 'package:mobile_app_flutter/models/screen-arguments.dart';

import 'selection-screen.dart';

List<PreviewItem> sectionData = [
  PreviewItem.image('https://i.pinimg.com/originals/f7/3a/5b/f73a5b4b7262440684a2b5c39e684304.jpg'),
  PreviewItem.image('https://miro.medium.com/max/2800/0*xMaFF2hSXpf_kIfG.jpg'),
  PreviewItem.image('https://andro-news.com/images/content/youtubemusic1.jpg', width: 200)
];

List<PreviewItem> sectionVideoData = [
  PreviewItem.video('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
  PreviewItem.video('https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4'),
  PreviewItem.video('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
];

class MainScreen extends StatelessWidget {
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 50, 42, 38),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.music,
                    color: Colors.red,
                    size: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2),
                    child: Text(
                      'Main screen',
                      style: TextStyle(fontSize: 22),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.search,
                    size: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Icon(
                      FontAwesomeIcons.user,
                      size: 12,
                    ),
                  ),
                ],
              )
            ],
          )),
      body: Builder(
        builder: (BuildContext context) =>
            SizedBox.expand(
                child: Container(
                  color: Color.fromARGB(255, 25, 19, 8),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text('Your favorites', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
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
                                    Text('Your favorite music videos', style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                            ),
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
                                  Text('LISTEN AGAIN', style: TextStyle(
                                      fontSize: 12,
                                    color: Colors.grey
                                  ),
                                  ),
                                  Text('Your evening music', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ),
                            PreviewList(sectionData, height: 140),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () => _navigateAndDisplaySelection(context),
                        child: Text('_navigateAndDisplaySelection'),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 50, 42, 38),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Explore')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                title: Text('Library')
            ),
          ]),
    );
  }
}
