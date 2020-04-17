import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/Pages/favourites.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff111111),
        appBar: AppBar(
          elevation: 0,
          title: Text("Music", style: TextStyle(fontSize: 35)),
          bottom: TabBar(
              unselectedLabelColor: Colors.grey[500],
              indicatorPadding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
              indicatorColor: Colors.green,
              tabs: [
                Tab(text: "Playlists"),
                Tab(text: "Artists"),
                Tab(text: "Albums"),
              ]),
        ),
        body: ScrollConfiguration(
          behavior: MyBehaviour(),
          child: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width*.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[900],
                      ),
                      child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            showCursor: debugDisableShadows,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0),
                              ),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0)),
                              hintText: 'Search in Playlists',
                              hintStyle: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w700)
                            ),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.green, Colors.blue])),
                    ),
                    title: Text("All Songs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(height: 15),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) => Favourite(),
                          ));
                    },
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.deepPurple, Colors.white])),
                      child: Center(
                          child:
                              Icon(CupertinoIcons.heart, color: Colors.white)),
                    ),
                    title: Text("Favourites",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.green, Colors.blue])),
                    ),
                    title: Text("All Songs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.green, Colors.blue])),
                    ),
                    title: Text("All Songs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(height: 60,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
