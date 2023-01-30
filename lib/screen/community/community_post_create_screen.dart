import 'package:flutter/material.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/component/post_bottom_sheet.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class CommunityPostCreateScreen extends StatelessWidget {
  const CommunityPostCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunityPostCreateAppBar(context),
      body: GestureDetector(
        // 다른 화면 클릭했을때 텍스트 필드 닫히게하기
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        isTitle: true,
                        placeHolder: '제목을 입력하세요. ',
                      ),
                      thin_sized_box_style(),
                      CustomTextField(
                        isTitle: false,
                        placeHolder:
                            '내용을 작성해주세요. \n\n상대방을 불쾌하게 하는 내용은 삼가해주세요.\n신고를 당하면 커뮤니티 이용이 제한될 수 있어요.',
                      ),
                      thin_sized_box_style(),
                      Column(
                        children: [
                          CategorySelected(context),
                          thin_sized_box_style(),
                          ImageVideoSelected(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 10.0),
              RegisteredButton(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar CommunityPostCreateAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: WHITE_COLOR,
      title: Text(
        '글쓰기',
        style: TextStyle(color: BLACK_COLOR),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: BLACK_COLOR,
          )),
    );
  }

  Padding CategorySelected(BuildContext context) {
    return Padding(
      padding: post_item_left_padding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '카테고리 선택',
            style: co_create_middle_title,
          ),
          Container(
            width: 58,
            height: 26,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], onPrimary: BLACK_COLOR),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return PostBottomSheet();
                  },
                );
              },
              child: Text('선택'),
            ),
          ),
        ],
      ),
    );
  }

  Padding ImageVideoSelected() {
    return Padding(
      padding: post_item_left_padding(),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '사진/동영상',
                style: co_create_middle_title,
              ),
              SizedBox(height: 10),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.grey[400],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding RegisteredButton(BuildContext context) {
    return Padding(
      padding: big_long_button(),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '등록',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
