import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

class ScreenLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const ScreenLayout({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
        backgroundColor: WHITE_COLOR,
        titleTextStyle: TextStyle(
          color: BLACK_COLOR,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: body,
    );
  }
}
