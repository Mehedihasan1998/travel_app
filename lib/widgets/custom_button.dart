import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({this.title, this.color, @required this.onPressed});
  final Color ?color;
  final String ?title;
  final Function() ?onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 50,
          child: Text(
            title!,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
