import 'package:flutter/material.dart';
import 'package:treepet/component/community_post.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/layout/screen_layout.dart';
import 'package:treepet/screen/community/community_post_create_screen.dart';
import 'package:treepet/screen/community/community_search_screen.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(context),
      appBar: CommunityAppBar(context),
      body: renderCommunityPost(),
    );
  }

  AppBar CommunityAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: WHITE_COLOR,
      title: const Text(
        '커뮤니티',
        style: TextStyle(color: BLACK_COLOR),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => CommunitySearchScreen()));
          },
          icon: Icon(Icons.search,color: Colors.black,),
        ),
      ],
    );
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => CommunityPostCreateScreen()));
      },
      backgroundColor: MAIN_COLOR,
      child: Icon(
        Icons.add,
      ),
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
