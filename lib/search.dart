import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/Pages/searching.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 110, 15, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(height: 10),
          Center(
            child: Text(
              "Search",
              style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => Searching(),
                      fullscreenDialog: true));
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(CupertinoIcons.search, color: Colors.black,),
                    SizedBox(width: 10,),
                    Text(
                      "Artists, Songs or Albums",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Your Top Genres",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 173,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                        colors: [Colors.deepOrange, Colors.orange]),
                  ),
                  child: Align(
                    alignment: Alignment(-0.85, -0.7),
                    child: Text(
                      "Pop",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 100,
                  width: 173,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(colors: [
                      CupertinoColors.activeBlue,
                      Colors.blueAccent
                    ]),
                  ),
                  child: Align(
                    alignment: Alignment(-0.85, -0.7),
                    child: Text(
                      "Hip-Hop",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 173,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                        colors: [Colors.teal[500], Colors.lightGreen]),
                  ),
                  child: Align(
                    alignment: Alignment(-0.85, -0.7),
                    child: Text(
                      "Electronic/\nDance",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 100,
                  width: 173,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                        colors: [CupertinoColors.systemRed, Colors.redAccent]),
                  ),
                  child: Align(
                    alignment: Alignment(-0.85, -0.7),
                    child: Text(
                      "Rock",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60,),
        ]),
      ),
    );
  }
}
