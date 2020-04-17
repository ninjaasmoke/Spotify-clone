import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'nowplaying.dart';

class Queue extends StatefulWidget {
  @override
  _QueueState createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Current Queue",),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                leading: Text("Now Playing"),
              ),
              ListTile(
                leading: Container(
                    height: 60,width: 60,child: Image.asset(photoOne, fit: BoxFit.cover,)),
                title: Text(songName, style: TextStyle(color: Colors.white),),
                subtitle: Text(artistName, style: TextStyle(color: Colors.grey[500]),),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(3),
            height: 100,

            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.white,
                  height: 15,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(width: 20,),
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
                    SizedBox(width: 20,)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
