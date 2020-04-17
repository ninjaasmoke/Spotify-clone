import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recent extends StatefulWidget {

  final Widget child;
  final String name;
  final Decoration decoration;

  Recent({@required this.child, this.name, this.decoration,});

  @override
  _RecentState createState() => _RecentState();
}


class _RecentState extends State<Recent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 115,
          width: 115,
          decoration: widget.decoration,
          child: widget.child,
        ),
        SizedBox(height: 5,),
        Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
      ],
    );
  }
}
