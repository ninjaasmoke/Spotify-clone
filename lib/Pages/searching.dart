import 'package:flutter/material.dart';
import 'package:myapp/search.dart';
import 'package:flutter/cupertino.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextFormField(

          autofocus: true,
          textAlign: TextAlign.center,
          showCursor: false,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
              ),
              prefixIcon: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,),
              onPressed:() {
                Navigator.pop(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => Search(),
                        fullscreenDialog: true));
              },),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0)),
              hintText: 'Search       ',
              hintStyle: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w700)
          ),
        ),
      ),
    );
  }
}
