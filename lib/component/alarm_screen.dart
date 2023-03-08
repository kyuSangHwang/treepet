import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

class alarmModel {
  final String title;
  final String nick;
  final String content;
  final String time;
  final AssetImage? image;

  alarmModel({
    required this.title,
    required this.nick,
    required this.content,
    required this.time,
    this.image,
  });
}

class AlarmScreen extends StatelessWidget {
  final alarmPost = [
    alarmModel(title: 'title', nick: 'nick', content: '진짜 귀엽다~!!', time: '2022-10-23'),
    alarmModel(title: 'title', nick: 'nick', content: '산책 잘 다녀왔어? ㅎㅎㅎ', time: '2022-10-25'),
    alarmModel(title: 'title', nick: 'nick', content: '재밌게 사시네요 ㅎㅎㅎㅎ', time: '2022-11-10', image: AssetImage('asset/image/dog1.jpeg')),
    alarmModel(title: '00가 00게시글에 댓글 달았습니다', nick: 'nick', content: '요즘 아픈 애들이 많은거같아요 ㅠㅠ', time: '2022-11-30'),
    alarmModel(title: '00가 00게시글에 댓글 달았습니다', nick: 'nick', content: '웨딩을 올리셨어요?', time: '2022-12-25'),
    alarmModel(title: 'title', nick: 'nick', content: '같이 산책할까요?', time: '2022-12-31', image: AssetImage('asset/image/dog1.jpeg')),
    alarmModel(title: '00가 00게시글에 댓글 달았습니다', nick: 'nick', content: '요즘 날이 풀려서 너무 좋아요 ㅎㅎㅎ', time: '2023-02-05', image: AssetImage('asset/image/dog1.jpeg')),
    alarmModel(title: '00가 00게시글에 댓글 달았습니다', nick: 'nick', content: '잘 지내고있죠? ㅎㅎ', time: '어제', image: AssetImage('asset/image/dog1.jpeg')),
  ];

  AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AlarmScreenAppBar(context),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return RenderAlarmPost(context);
        },
      ),
    );
  }

  AppBar AlarmScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      title: const Text('알람', style: TextStyle(color: BLACK_COLOR)),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderAlarmPost(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        children: alarmPost.reversed
            .map(
              (post) => GestureDetector(
                onTap: () {
                  print('해당 화면으로 이동');
                },
                behavior: HitTestBehavior.opaque,
                child: ListTile(
                  leading: CircleAvatar(),
                  title: Text(post.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.content),
                      SizedBox(height: 4),
                      Text(post.time),
                    ],
                  ),
                  trailing: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: post.image != null
                          ? Image(image: post.image!)
                          : SizedBox.shrink(),
                    ),
                  ),
                  isThreeLine: true,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
