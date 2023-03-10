import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/mypage/settings/announcement/announcement_post_detail_screen.dart';

class announcementModel {
  final String title;
  final String time;

  announcementModel({
    required this.title,
    required this.time,
  });
}

class SettingsAnnouncementListScreen extends StatelessWidget {
  final announcementPost = [
    announcementModel(title: '1111트리펫 MVP 테스트 오픈', time: '2023.02.05'),
    announcementModel(title: '2222트리펫 MVP 테스트 오픈', time: '2023.02.05'),
    announcementModel(title: '3333트리펫 MVP 테스트 오픈', time: '2023.02.05'),
    announcementModel(title: '4444트리펫 MVP 테스트 오픈', time: '2023.02.05'),
  ];

  SettingsAnnouncementListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAnnouncementScreenAppBar(context),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return RenderAnnouncementPost(context);
        },
      ),
    );
  }

  AppBar SettingAnnouncementScreenAppBar(BuildContext context) {
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
        '공지사항',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderAnnouncementPost(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (0.92),
      child: Column(
        children: announcementPost.reversed
            .map(
              (post) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/announcementPostDetailScreen');

                },
                behavior: HitTestBehavior.opaque,
                child: ListTile(
                  leading: Text(post.title, style: announcement_title,),
                  trailing: Text(post.time, style: announcement_concent,),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}