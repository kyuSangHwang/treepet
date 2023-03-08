import 'package:flutter/material.dart';
import 'package:treepet/component/community_post.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/layout/screen_layout.dart';
import 'package:treepet/screen/community/community_post_create_screen.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(context),
      body: ScreenLayout(
        title: '커뮤니티',
        body: renderCommunityPost(),
        screenKey: 'community',
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => CommunityPostCreateScreen()));
        // Navigator.of(context).pushNamed('CommunityPostCreateScreen');
      },
      backgroundColor: MAIN_COLOR,
      child: const Icon(
        Icons.add,
      ),
    );
  }

  Scrollbar renderCommunityPost() {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Column(
            children: const [
              CommunityPost(
                title: '우울표정보스 hello HELLO',
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
