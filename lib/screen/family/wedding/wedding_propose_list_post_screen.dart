import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/family/wedding/wedding_propose_detail_screen.dart';

class WeddingProposeListPostScreen extends StatelessWidget {
  final String imagePath;
  final String nickName;
  final String location;
  final String receivedDate; /// TODO: DateTime type 으로 변경해야함
  final bool readStatus;
  final String receivedContent;

  const WeddingProposeListPostScreen({
    required this.imagePath,
    required this.nickName,
    required this.location,
    required this.receivedDate,
    required this.readStatus,
    required this.receivedContent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const WeddingProposeDetailScreen()));
      },
      child: Container(
        decoration: PostBorderStyle(),
        child: Row(
          children: [
            const SizedBox(width: 15.0),
            PostListImage(),
            Expanded(
              flex: 4,
              child: _PostInformation(
                nickName: nickName,
                location: location,
                receivedContent: receivedContent,
              ),
            ),
            Column(
              children: [
                Text(receivedDate, style: co_list_post_comment),
                Icon(
                    Icons.wb_twighlight,
                    color: readStatus == false ? Colors.red : Colors.green
                ),
              ],
            ),
            const SizedBox(width: 15.0),
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
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 55.0,
      height: 55.0,
    );
  }
}

// 목록형 게시글에서 정보 부분
class _PostInformation extends StatelessWidget {
  final String nickName;
  final String location;
  final String receivedContent;

  const _PostInformation({
    required this.nickName,
    required this.location,
    required this.receivedContent,
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
              Text(
                nickName,
                style: wedding_propose_list_post,
              ),
              const SizedBox(width: 8.0),
              Text(
                location,
                style: co_list_post_title_sub,
              ),
            ],
          ),
          const SizedBox(height: 6.0),
          Row(
            children: [
              /// TODO: 이후 메시지 받은 시간과 알람 기호가 있는 영역에 min, max 넓이를 주어서 하위의 SizedBox의 넓이를 유동적으로 변경되게 해주어야한다.
              SizedBox(
                width: 200,
                child: Text(
                    receivedContent,
                    style: wedding_propose_list_post_2,
                    overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
