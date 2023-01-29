import 'package:flutter/material.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/component/post_bottom_sheet.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/text_style.dart';
import 'package:treepet/layout/screen_layout.dart';

class CommunityPostCreateScreen extends StatelessWidget {
  const CommunityPostCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: GestureDetector(
        // 다른 화면 클릭했을때 텍스트 필드 닫히게하기
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomTextField(
                  isTitle: true,
                  placeHolder: '제목을 입력하세요.',
                ),
                SizedBox(height: 20),
                CustomTextField(
                  isTitle: false,
                  placeHolder: '내용을 입력하세요.',
                ),
                SizedBox(
                  height: 100,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '카테고리 선택',
                        style: mainTextStyle.copyWith(fontSize: 16),
                      ),
                      Container(
                        width: 58,
                        height: 26,
                        child: ElevatedButton(
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
                  Row(
                    children: [
                      Text(
                        '사진/동영상',
                        style: mainTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('등록',style: TextStyle(fontSize: 22),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
