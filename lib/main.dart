import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Pages/favourites.dart';
import 'package:myapp/Pages/nowplaying.dart';
import 'package:myapp/home.dart';
import 'package:myapp/profile.dart';
import 'package:myapp/search.dart';

String songName = "Song Name";
String artistName = "Artist Name";
String albumName = "Album Name";
String photoOne = 'assets/images/cod.jpg';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
      ),
      child: MaterialApp(
        home: Home(),
        routes: {
          '/Home': (context) => Home(),
          '/Fav': (context) => Favourite(),

        },
        theme: ThemeData(
          disabledColor: Colors.grey[700],
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            accentColor: Colors.transparent,
            primaryColor: Color(0xff111111),
            textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final List<Widget> _child = [HomePage(), Search(), Profile()];

  void onTapBar(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f0f0f), Color(0xff203670)],
            begin: FractionalOffset(0.39, 0.3),
            end: FractionalOffset(0.1, 0.05),
          ),
        ),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _child[index],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 4,
              onTap: onTapBar,
              currentIndex: index,
              iconSize: 30,
              backgroundColor: Color(0xff202022),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[600],
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search), title: Text("Search")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.queue_music),
                    title: Text("Your Music")),
              ],
              // currentIndex: (index),
            ),
          ),
        ),
      ),
      Positioned(
        width: MediaQuery.of(context).size.width,
        height: 55,
        bottom: 60,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff202022),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0,
                spreadRadius: .1,
              ),
              BoxShadow(
                color: Colors.black,
                blurRadius: 0,
                spreadRadius: .5,
                offset: Offset(
                  0, .5
                )
              ),

            ]
          ),
          width: MediaQuery.of(context).size.width,
          height: 55,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => NowPlaying(photo: photoOne,),
                      fullscreenDialog: true));
            },
            color: Color(0xff202022),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      love = ! love;
                    });
                  },
                  icon: love?
                  Icon(CupertinoIcons.heart_solid,
                    color: Colors.green,
                    size: 25,):
                  Icon(CupertinoIcons.heart,
                    color: Colors.white,
                    size: 25,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width* .05,),
                SizedBox(
                  width: MediaQuery.of(context).size.width* .48,
                  child: Row(
                    children: <Widget>[
                      Text(
                        songName+".", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                      Text(
                        artistName, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        playing = !playing;
                      });
                    },
                    icon: playing? Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                      size: 30,
                    ):
                    Icon(
                      Icons.pause_circle_outline,
                      color: Colors.white,
                      size: 30,
                    )),
                IconButton(icon: Icon(Icons.skip_next, color: Colors.white,),
                onPressed: () {},),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
