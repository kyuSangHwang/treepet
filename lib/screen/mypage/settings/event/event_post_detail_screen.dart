import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

class EventPostDetailScreen extends StatelessWidget {
  const EventPostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EventPostDetailScreenAppBar(context),
      body: RenderEventPostDetail(),
    );
  }

  AppBar EventPostDetailScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: BLACK_COLOR,
        ),
      ),
      title: Text(
        '이벤트',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderEventPostDetail() {
    return Container();
  }
}
