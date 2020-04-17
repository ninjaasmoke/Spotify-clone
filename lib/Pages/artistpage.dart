import 'package:flutter/material.dart';
import 'package:myapp/Pages/nowplaying.dart';
import 'package:myapp/main.dart';
import 'package:flutter/cupertino.dart';

int songs;

class Artist extends StatefulWidget {
  final String photo;
  final String artist;
  Artist({@required this.photo, this.artist});
  @override
  _ArtistState createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
        backgroundColor: Color(0xff111111),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: true,
                elevation: 0,
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * .5,
                backgroundColor: Color(0xff111111),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: Text(
                    widget.artist,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                  ),
                  centerTitle: true,
                  background: Stack(
                    children: <Widget>[
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          widget.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff000000).withOpacity(0.2),
                                  Color(0xff111111),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
//                      Center(
//                        child: Text(
//                          widget.artist,
//                          style: TextStyle(
//                              fontWeight: FontWeight.w900, fontSize: 50),
//                        ),
//                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
//                      if(index > 40) {return null;}
                  return ListTile(
                    title: Text(
                      "Song name",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    leading: Text("$index"),
                  );
                }, childCount: 21),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        width: MediaQuery.of(context).size.width,
        height: 100,
        bottom: 0,
        child: Column(
          children: <Widget>[
            Container(
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
                      icon: love? Icon(CupertinoIcons.heart_solid, color: Colors.green, size: 25,): Icon(CupertinoIcons.heart, color: Colors.white, size: 25,),
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
                          Icons.play_circle_filled,
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
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                alignment: Alignment.center,
                child: Text(
                  "SHUFFLE PLAY", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1, decoration: TextDecoration.none),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}


