import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treepet/component/custom_image_picker.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/component/post_bottom_sheet.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class CommunityPostCreateScreen extends StatefulWidget {
  const CommunityPostCreateScreen({Key? key}) : super(key: key);

  @override
  State<CommunityPostCreateScreen> createState() =>
      _CommunityPostCreateScreen();
}

class _CommunityPostCreateScreen extends State<CommunityPostCreateScreen> {
  // 이미지와 비디오를 리턴받을 수 있다 (선택 안할수도있으니 ? = null)
  XFile? image;

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
      elevation: 0,
      centerTitle: false,
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
    List<int> numbers = List.generate(4, (index) => index);

    return Padding(
      padding: post_item_left_padding(),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '사진/동영상',
                style: co_create_middle_title,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      onImageTap();
                    },
                    child: Container(
                      width: 79.6,
                      height: 79.6,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // image == null ? renderEmpty() :
                          onImageTap();
                        },
                        icon: Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  //TODO : 나열될 사진들 GridView로 보여주기
                  // 선택한 이미지를 모아둘 리스트 변수를 만든다
                  // 이미지의 경로를 만든 리스트변수에 넣는다
                  // GridView 안에서 mapping 해서 toList 로 만들어 화면에 출력한다
                  // if (image != null)
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: GridView.count(
                  //     primary: false,
                  //     shrinkWrap: true,
                  //     crossAxisCount: 4,
                  //     crossAxisSpacing: 8,
                  //     children: numbers
                  //         .map((e) => renderContainer(index: e))
                  //         .toList(),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderEmpty() {
    return Container(
      height: 100,
      width: 100,
      color: BLACK_COLOR,
    );
  }

  // Widget renderImage() {
  //   return Center(
  //     child: CustomImagePicker(
  //       image: image!,
  //       onNewImagePressed: () {
  //         onImageTap();
  //
  //       },
  //     ),
  //   );
  // }

  void onImageTap() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        this.image = image;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택 안함');
      }
    }
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

  // TODO : 출력되는 이미지 컨테이너
  // Widget renderContainer({
  //   required int index,
  // }) {
  //   print(index);
  //
  //   return Container(
  //     height: (MediaQuery.of(context).size.width - 32) / 5,
  //     color: Colors.blueAccent,
  //     child: Center(
  //       child: Text(
  //         index.toString(),
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.w700,
  //           fontSize: 30.0,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
