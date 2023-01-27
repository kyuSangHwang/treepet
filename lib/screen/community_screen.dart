import 'package:flutter/material.dart';
import 'package:treepet/component/community_post_list.dart';
import 'package:treepet/layout/screen_layout.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: '커뮤니티',
      body: renderCommunityPost(),
    );
  }

  renderCommunityPost() {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CommunityPost(
                title: '우울표정보스 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ',
                nick: '뭉치',
                given: 3,
                views: 24,
                comment: 3,
              ),
            ],
          );
        },
      ),
    );
  }
}
