import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app_flutter/%20bloc/playlist-bloc.dart';
import 'package:mobile_app_flutter/enum/option.dart';
import 'package:mobile_app_flutter/enum/routes.dart';

import 'package:mobile_app_flutter/models/preview-item.dart';
import 'package:mobile_app_flutter/models/screen-arguments.dart';
import 'package:mobile_app_flutter/pages/currency-screen.dart';
import 'package:mobile_app_flutter/pages/likes.dart';
import 'package:mobile_app_flutter/pages/playlist.dart';
import 'package:mobile_app_flutter/providers/preview-item-provider.dart';
import 'package:provider/provider.dart';

import 'pages/main.dart';
import 'pages/menu.dart';
import 'pages/library-screen.dart';

Map<int, String> bottomNavigationRoutes = {
  0: Routes['default'],
  1: Routes['second'],
  2: Routes['library'],
  3: Routes['currency'],
};

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
          child: BlocProvider(
            create: (_) => PlaylistBloc(),
            child: Navigator(
              key: _navigatorKey,
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;

                if (settings.name == Routes['default']) builder = (BuildContext context) => MainScreen();
                if (settings.name == Routes['second']) builder = (BuildContext context) => DetailScreen();
                if (settings.name == Routes['library']) builder = (BuildContext context) => LibraryScreen();
                if (settings.name == Routes['likes']) builder = (BuildContext context) => LikesScreen(Option.like);
                if (settings.name == Routes['dislikes']) builder = (BuildContext context) => LikesScreen(Option.dislike);
                if (settings.name == Routes['playlist']) builder = (BuildContext context) => Playlist();
                if (settings.name == Routes['menu']) builder = (BuildContext context) => Menu();
                if (settings.name == Routes['currency']) builder = (BuildContext context) => CurrencyScreen();
                if (!Routes.containsValue(settings.name)) throw Exception('Invalid route: ${settings.name}');

                return MaterialPageRoute(
                  builder: builder,
                  settings: settings,
                );
              },
            ),
          )

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

                print(index);

                _navigatorKey.currentState.pushReplacementNamed(bottomNavigationRoutes[index]);
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Explore')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_music),
                  title: Text('Library')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money),
                  title: Text('Currency')),
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
        title: Text(args?.title ?? 'Explore'),
      ),
      body: Center(
        child: Text(args?.message ?? 'Explore message'),
      ),
    );
  }
}
