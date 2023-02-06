import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/mypage/settings/settings_announcement_list_screen.dart';

class AnnouncementPostDetailScreen extends StatelessWidget {
  const AnnouncementPostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnnouncementPostDetailScreenAppBar(context),
      body: RenderAnnouncementPostDetail(),
    );
  }

  AppBar AnnouncementPostDetailScreenAppBar(BuildContext context) {
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
      // title: Text(
      //   '차단 목록',
      //   style: TextStyle(color: BLACK_COLOR),
      // ),
    );
  }

  Widget RenderAnnouncementPostDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '트리펫 MVP 테스트를 시작합니다.',
                style: announcement_detail_title,
              ),
              const SizedBox(height: 20),
              Text(
                '오늘',
                style: announcement_detail_sub,
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Text(
            '안녕하세요~~ \n'
                '시장의 반응을 보기위한 mvp 테스트를 위한 오픈 테스트입니다.',
            style: announcement_detail_concent,
          ),
        ),
      ],
    );
  }
}
