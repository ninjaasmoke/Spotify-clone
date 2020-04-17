import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Pages/artistpage.dart';
import 'package:myapp/Pages/queue.dart';
import 'package:myapp/main.dart';

bool shuffle = false;
bool playing = true;
bool repeat = false;
bool love = false;
Color shuffleColor = Colors.green;

class NowPlaying extends StatefulWidget {

  final String photo;

  NowPlaying({@required this.photo});
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {

  bool menu = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff905020),
            Color(0xff121212)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Stack(
        children: <Widget>[
          OrientationBuilder(
            builder: (_, orientation) {
              if(orientation == Orientation.portrait) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    elevation: 0,

                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Column(
                      children: <Widget>[
                        Text(
                          "PLAYING FROM ARTIST",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              letterSpacing: 2),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) => Artist(photo: 'assets/images/cod.jpg',artist: artistName,),
                                    fullscreenDialog: true
                                ));
                          },
                          child: Text(
                            artistName,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                letterSpacing: 0),
                          ),
                        )
                      ],
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.format_indent_increase, color: Colors.white,),
                        onPressed: () {
                          setState(() {
                            menu = true;
                          });
                        },
                      ),
                    ],
                  ),
                  body: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(25,0,25,25),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            Center(
                              child: Container(
                                child: Image.asset(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                ),
                                height: MediaQuery.of(context).size.height * .38,
                                width: MediaQuery.of(context).size.height * .38,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 4,
                                    spreadRadius: 0.1,
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      songName,
                                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            CupertinoPageRoute(
                                                builder: (BuildContext context) => Artist(photo: widget.photo, artist: artistName,),
                                                fullscreenDialog: true
                                            ));
                                      },
                                      child: Text(
                                        artistName,
                                        style:
                                        TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1,),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      love  = ! love;
                                    });
                                  },
                                  icon: love?
                                  Icon(CupertinoIcons.heart_solid,
                                    color: Colors.green,):
                                  Icon(CupertinoIcons.heart,
                                    color: Colors.white,),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 2,
                              height: 55,
                              indent: 5,
                              endIndent: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Icon(CupertinoIcons.shuffle,
                                        color: shuffle ? Colors.green : Colors.white,
                                        size: 30),
                                    onTap: () {
                                      setState(() {
                                        shuffle = !shuffle;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.skip_previous,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          playing = !playing;
                                        });
                                      },
                                      child: playing? Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.white,
                                        size: 70,
                                      ):
                                      Icon(
                                        Icons.pause_circle_filled,
                                        color: Colors.white,
                                        size: 70,
                                      )),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.skip_next,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onTap: () {},
                                  ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    child: Icon(CupertinoIcons.refresh_thin,
                                        color: repeat ? Colors.green : Colors.white,
                                        size: 30),
                                    onTap: () {
                                      setState(() {
                                        repeat = !repeat;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(Icons.devices_other, color: Colors.white,),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(builder: (BuildContext context) =>
                                              Queue(),
                                              fullscreenDialog: true)
                                      );
                                    },
                                    child: Icon(Icons.playlist_play, color: Colors.white, size: 30,)
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              else{
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(

                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Column(
                      children: <Widget>[
                        Text(
                          "PLAYING FROM ARTIST",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              letterSpacing: 2),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) => Artist(photo: 'assets/images/cod.jpg',artist: artistName,),
                                    fullscreenDialog: true
                                ));
                          },
                          child: Text(
                            artistName,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                letterSpacing: 0),
                          ),
                        )
                      ],
                    ),
                  ),
                  body: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .006,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    child: Image.asset(
                                      widget.photo,
                                      fit: BoxFit.cover,
                                    ),
                                    height: MediaQuery.of(context).size.height * .25,
                                    width: MediaQuery.of(context).size.height * .25,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 4,
                                        spreadRadius: 0.1,
                                      )
                                    ]),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        songName,
                                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40),
                                      ),
                                      SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              CupertinoPageRoute(
                                                  builder: (BuildContext context) => Artist(photo: widget.photo, artist: artistName,),
                                                  fullscreenDialog: true
                                              ));
                                        },
                                        child: Text(
                                          "$artistName",
                                          style:
                                          TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1, fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*.1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        love = ! love;
                                      });
                                    },
                                    icon: love? Icon(CupertinoIcons.heart_solid, color: Colors.green, size: 30,): Icon(CupertinoIcons.heart, color: Colors.white, size: 30,),
                                  ),
                                  SizedBox(width: 20),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(builder: (BuildContext context) =>
                                            Queue(),
                                            fullscreenDialog: true)
                                        );
                                      },
                                      icon: Icon(Icons.playlist_play, color: Colors.white, size: 30,)
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                                thickness: 2,
                                height: 25,
                                indent: 30,
                                endIndent: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(CupertinoIcons.shuffle,
                                          color: shuffle ? Colors.green : Colors.white,
                                          size: 30),
                                      onPressed: () {
                                        setState(() {
                                          shuffle = !shuffle;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.fast_rewind,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      onPressed: () {},
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            playing = !playing;
                                          });
                                        },
                                        child: playing? Icon(
                                          Icons.play_circle_filled,
                                          color: Colors.white,
                                          size: 70,
                                        ):
                                        Icon(
                                          Icons.pause_circle_filled,
                                          color: Colors.white,
                                          size: 70,
                                        )),
                                    IconButton(
                                      icon: Icon(
                                        Icons.fast_forward,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(CupertinoIcons.refresh_thin,
                                          color: repeat ? Colors.green : Colors.white,
                                          size: 30),
                                      onPressed: () {
                                        setState(() {
                                          repeat = !repeat;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            top: 0,
            child: menu? OrientationBuilder(
              builder: (_, orient) {
                if(orient == Orientation.portrait) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        menu = false;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Icon(CupertinoIcons.shuffle,
                                        color: shuffle ? Colors.green : Colors.white,
                                        size: 30),
                                    onTap: () {
                                      setState(() {
                                        shuffle = !shuffle;
                                      });
                                    },
                                  ),
                                  GestureDetector(
                                    child: Icon(CupertinoIcons.refresh_thin,
                                        color: repeat ? Colors.green : Colors.white,
                                        size: 30),
                                    onTap: () {
                                      setState(() {
                                        repeat = !repeat;
                                      });
                                    },
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        menu = false;
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(builder: (BuildContext context) =>
                                                Queue(),
                                                fullscreenDialog: true)
                                        );
                                      },
                                      child: Icon(Icons.playlist_play, color: Colors.white, size: 30,)
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: MediaQuery.of(context).size.height * .39,
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.transparent, Colors.black],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: 30,),
                                      Container(
                                        height: 150,
                                        width: 150,
                                        child: Image.asset(widget.photo, fit: BoxFit.cover,),
                                      ),
                                      SizedBox(height: 15,),
                                      Text
                                        (artistName, style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.w800,letterSpacing: 1, fontSize: 16, decoration: TextDecoration.none
                                      ),),
                                      Text
                                        (albumName, style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.w400,letterSpacing: 1, fontSize: 16, decoration: TextDecoration.none
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.black,
                              child: Container(
                                height: MediaQuery.of(context).size.height* .48,
                                color: Colors.black,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        onTap: () {
                                          menu = true;
                                          setState(() {
                                            love = ! love;
                                          });
                                        },
                                        leading: love? Icon(CupertinoIcons.heart_solid, color: Colors.green,):
                                        Icon(CupertinoIcons.heart, color: Colors.white,),
                                        title: love? Text("Remove from Favourites",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),):
                                        Text("Add to Favourites",
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.playlist_add, color: Colors.white,),
                                        title: Text("Add to Playlist", style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                        ),),
                                        onTap: () {
                                          menu = false;
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.album, color: Colors.white,),
                                        title: Text("View Album", style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                        ),),
                                        onTap: () {
                                          menu = false;
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(CupertinoIcons.person, color: Colors.white,),
                                        title: Text("View Artist", style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                        ),),
                                        onTap: () {
                                          menu = false;
                                          Navigator.push(context,
                                              CupertinoPageRoute(
                                                  builder: (BuildContext context) => Artist(photo: widget.photo, artist: artistName,),
                                                  fullscreenDialog: true
                                              ));
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.share, color: Colors.white,),
                                        title: Text("Share", style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                        ),),
                                        onTap: () {
                                          menu = false;
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.timelapse, color: Colors.white,),
                                        title: Text("Sleep Timer", style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                        ),),
                                        onTap: () {
                                          menu = false;
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(CupertinoIcons.flag, color: Colors.white,),
                                        title: Text("Report Content", style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                        ),),
                                        onTap: () {
                                          menu = false;
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.people_outline, color: Colors.white,),
                                        title: Text("Show Credits", style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w600
                                        ),),
                                        onTap: () {
                                          menu = false;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                else {
                  menu = false;
                  return Container(height: 0, width: 0,);
                }
              },
            ): Container(width: 0, height: 0,),
          )
        ],
      ),
    );
  }
}
