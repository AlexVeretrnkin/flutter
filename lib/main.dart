import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobile_app_flutter/models/preview-item.dart';
import 'package:mobile_app_flutter/models/screen-arguments.dart';
import 'package:mobile_app_flutter/providers/preview-item-provider.dart';
import 'package:provider/provider.dart';

import 'pages/main.dart';
import 'pages/menu.dart';
import 'pages/selection-screen.dart';

const Map<int, String> Routes = {0: '/', 1: '/second', 2: '/third', 3: '/menu'};

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

void main() {
  // runApp(MyApp()); - sample app (first created)

  runApp(ChangeNotifierProvider(
    create: (context) => PreviewItemProvider(),
    child: Main(),
  ));
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
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
        body: WillPopScope(
          onWillPop: () async {
            if (_navigatorKey.currentState.canPop()) {
              _navigatorKey.currentState.pop();
              return false;
            }
            return true;
          },
          child: Navigator(
            key: _navigatorKey,
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              WidgetBuilder builder;
              // Manage your route names here
              switch (settings.name) {
                case '/':
                  builder = (BuildContext context) => MainScreen();
                  break;
                case '/second':
                  builder = (BuildContext context) => DetailScreen();
                  break;
                case '/third':
                  builder = (BuildContext context) => SelectionScreen();
                  break;
                case '/menu':
                  builder = (BuildContext context) => Menu();
                  break;
                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
              // You can also return a PageRouteBuilder and
              // define custom transitions between pages
              return MaterialPageRoute(
                builder: builder,
                settings: settings,
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 50, 42, 38),
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              if (_selectedIndex != index) {
                setState(() {
                  _selectedIndex = index;
                });

                _navigatorKey.currentState.pushReplacementNamed(Routes[index]);

                // if (index == 0 && _navigatorKey.currentState.canPop()) {
                //   _navigatorKey.currentState.pop();
                // } else {
                //   // _navigatorKey.currentState.pushNamedAndRemoveUntil(Routes[index], ModalRoute.withName('/'));
                // }
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Explore'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_music), title: Text('Library')),
            ]),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    print(args);

    return Scaffold(
      appBar: AppBar(
        title: Text('args.title'),
      ),
      body: Center(
        child: Text('args.title'),
      ),
    );
  }
}
