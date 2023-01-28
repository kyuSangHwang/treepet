import 'package:flutter/material.dart';
import 'package:treepet/component/community_post_list.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/layout/screen_layout.dart';
import 'package:treepet/screen/community/community_post_create_screen.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: renderFloatingActionButton(),
      body: ScreenLayout(
        title: '커뮤니티',
        body: renderCommunityPost(),
      ),
    );
  }

  // FloatingActionButton renderFloatingActionButton() {
  //   final BuildContext context;
  //
  //   return FloatingActionButton(
  //     onPressed: () {
  //       Navigator.of(context).push(MaterialPageRoute(builder: (_) => CommunityPostCreateScreen()));
  //     },
  //     backgroundColor: MAIN_COLOR,
  //     child: Icon(
  //       Icons.add,
  //     ),
  //   );
  // }

  renderCommunityPost() {
    return Scrollbar(
      child: GestureDetector(
        onTap: () {
          print('안녕');
        },
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
      ),
    );
  }
}
