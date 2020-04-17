import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/Pages/artistpage.dart';
import 'package:myapp/Pages/favourites.dart';
import 'package:myapp/main.dart';
import 'package:myapp/settings.dart';
import 'Utils/recent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 0, 5, 110),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => Settings()));
                        },
                        icon: Icon(CupertinoIcons.settings, size: 30.0),
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Recently played",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (BuildContext context) => Favourite())),
                          child: Recent(
                            child: Icon(CupertinoIcons.heart_solid, color: Colors.white, size: 35,),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Color(0xff250060)
                                ],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                              )
                            ),
                            name: 'Favourites',
                          ),
                        ),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) => Artist(artist: artistName,photo: photoOne,),
                                    fullscreenDialog: false));
                          },
                          child: Recent(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                photoOne,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(57),
                            ),
                            name: artistName,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Made For You",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.amberAccent])),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.green, Colors.greenAccent])),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.pinkAccent])),
                        ),
                        SizedBox(width: 15),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.deepPurpleAccent,
                            Colors.blueAccent
                          ])),
                        ),
                        SizedBox(width: 14,)
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                ]),
        ),
      ),
    );
  }
}
