import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

class ScreenLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final String? screenKey;

  const ScreenLayout({
    required this.title,
    required this.body,
    this.screenKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
        backgroundColor: WHITE_COLOR,
        titleTextStyle: const TextStyle(
          color: BLACK_COLOR,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        leading: screenKey == 'wedding'
            ? IconButton(
                onPressed: () {
                  if (screenKey != null && screenKey == "wedding") {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).maybePop();
                  }
                },
                icon: Icon(Icons.arrow_back, color: BLACK_COLOR),
              )
            : null,
      ),
      body: body,
    );
  }
}
