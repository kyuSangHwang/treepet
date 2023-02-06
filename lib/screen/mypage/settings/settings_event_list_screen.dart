import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class eventModel {
  final String title;
  final String time;

  eventModel({
    required this.title,
    required this.time,
  });
}

class SettingsEventListScreen extends StatelessWidget {
  final eventPost = [
    eventModel(title: '1111트리펫 MVP 오픈했습니다~! 모두 축하해주세요~!', time: '2023.02.06'),
    eventModel(title: '2222 반려동물과 찰칵', time: '2023.02.07'),
    eventModel(title: '3333 오늘도 내일도 산책하자', time: '2023.02.08'),
    eventModel(title: '4444 치카치카 양치데이', time: '2023.02.10'),
  ];

  SettingsEventListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingEventScreenAppBar(context),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return RenderEventPost(context);
        },
      ),
    );
  }

  AppBar SettingEventScreenAppBar(BuildContext context) {
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

  Widget RenderEventPost(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (0.92),
      child: Column(
        children: eventPost.reversed
            .map(
              (post) => GestureDetector(
            onTap: () {
              print('안클릭클릭녕');
            },
            behavior: HitTestBehavior.opaque,
            child: ListTile(
              title: Text(post.title, style: event_title,),
              trailing: Text(post.time, style: event_concent,),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}