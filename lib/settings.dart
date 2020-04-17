import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/Pages/nowplaying.dart';
import 'package:myapp/main.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(),
        Positioned(
          height: MediaQuery.of(context).size.height - 50,
          width: MediaQuery.of(context).size.width,
          bottom: 50,
          child: Scaffold(
            backgroundColor: Color(0xff111111),
            appBar: AppBar(
              title: Text("Settings",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              centerTitle: true,
              backgroundColor: Color(0xff202022),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(onPressed: () {}, label: Text("SHUFFLE PLAY"),
              backgroundColor: Colors.green,),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: 55,
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
                      GestureDetector(child: Icon(Icons.skip_next, color: Colors.white,),
                      onTap: () {},),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}