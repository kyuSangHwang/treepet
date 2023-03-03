import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/community/community_post_detail_screen.dart';
import 'package:treepet/test.dart';

class CommunityPost extends StatelessWidget {
  final String title;
  final String nick;
  final int given;
  final int views;
  final int comment;

  const CommunityPost({
    required this.title,
    required this.nick,
    required this.given,
    required this.views,
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CommunityPostDetailScreen()));
        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyHomePage()));
      },
      child: Container(
        decoration: PostBorderStyle(),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: _PostInformation(
                title: title,
                nick: nick,
                given: given,
                views: views,
              ),
            ),
            PostListImage(),
            SizedBox(width: 10.0),
            Container(
              child: Column(
                children: [
                  Text('$comment'),
                  Text(
                    '댓글',
                    style: co_list_post_comment,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }

  // 게시글 테두리 스타일
  BoxDecoration PostBorderStyle() {
    return BoxDecoration(
      border: Border.all(
        color: LIST_BORDER_COLOR,
        width: 1.0,
      ),
      // borderRadius: BorderRadius.circular(8.0),
    );
  }

  // 이미지
  Container PostListImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/image/postTest1.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 48.0,
      height: 48.0,
    );
  }
}

// 목록형 게시글에서 정보 부분
class _PostInformation extends StatelessWidget {
  final String title;
  final String nick;
  final int given;
  final int views;

  const _PostInformation({
    required this.title,
    required this.nick,
    required this.given,
    required this.views,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: co_list_post_title),
            ],
          ),
          SizedBox(height: 6.0),
          Row(
            children: [
              Text(
                nick,
                style: co_list_post_title_sub,
              ),
              SizedBox(width: 8.0),
              Icon(Icons.timer, size: 16),
              Text(
                '$given시간 전',
                style: co_list_post_title_sub,
              ),
              SizedBox(width: 8.0),
              Icon(Icons.remove_red_eye_sharp, size: 16),
              Text(
                views.toString(),
                style: co_list_post_title_sub,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
