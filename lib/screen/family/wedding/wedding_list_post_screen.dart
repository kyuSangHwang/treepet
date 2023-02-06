import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/community/community_post_detail_screen.dart';
import 'package:treepet/screen/family/wedding/wedding_post_detail_screen.dart';

class WeddingListPost extends StatelessWidget {
  final String title;
  final String nickName;
  final String location;
  final String petKind;
  final String petVariety;
  final String petGender;
  final int petAge;
  final double petWeight;
  final int comment;

  const WeddingListPost({
    required this.title,
    required this.nickName,
    required this.location,
    required this.petKind,
    required this.petVariety,
    required this.petGender,
    required this.petAge,
    required this.petWeight,
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => WeddingPostDetailScreen()));
      },
      child: Container(
        decoration: PostBorderStyle(),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: _PostInformation(
                title: title,
                nickName: nickName,
                location: location,
                petKind: petKind,
                petVariety: petVariety,
                petGender: petGender,
                petAge: petAge,
                petWeight: petWeight,
                comment: comment,
              ),
            ),
            PostListImage(),
            const SizedBox(width: 10.0),
            Column(
              children: [
                Text('$comment'),
                Text(
                  '댓글',
                  style: co_list_post_comment,
                ),
              ],
            ),
            const SizedBox(width: 10.0),
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
        image: const DecorationImage(
          image: AssetImage('asset/image/treepetMale.jpeg'),
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
  final String nickName;
  final String location;
  final String petKind;
  final String petVariety;
  final String petGender;
  final int petAge;
  final double petWeight;
  final int comment;

  const _PostInformation({
    required this.title,
    required this.nickName,
    required this.location,
    required this.petKind,
    required this.petVariety,
    required this.petGender,
    required this.petAge,
    required this.petWeight,
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String petAgeInfo = petAge.toString();
    final String petWeightInfo = petWeight.toString();

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
          const SizedBox(height: 6.0),
          Row(
            children: [
              Text(
                nickName,
                style: co_list_post_title_sub,
              ),
              const SizedBox(width: 8.0),
              const Icon(Icons.location_on, size: 13),
              Text(
                location,
                style: co_list_post_title_sub,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                petKind,
                style: co_list_post_title_sub,
              ),
              const SizedBox(width: 8.0),
              Text(
                petVariety,
                style: co_list_post_title_sub,
              ),
              const SizedBox(width: 8.0),
              Text(
                petGender,
                style: co_list_post_title_sub,
              ),
              const SizedBox(width: 8.0),
              Text(
                '$petAgeInfo 살',
                style: co_list_post_title_sub,
              ),
              const SizedBox(width: 8.0),
              Text(
                '$petWeightInfo kg',
                style: co_list_post_title_sub,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
