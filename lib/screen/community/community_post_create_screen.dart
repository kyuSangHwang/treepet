import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  late File _imageFile = File(" ");
  List<dynamic> imageFilesList = [];
  List<Widget> imagesWidgetList = [];

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
                      const CustomTextField(
                        isTitle: true,
                        placeHolder: '제목을 입력하세요. ',
                      ),
                      thin_sized_box_style(),
                      const CustomTextField(
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
      title: const Text(
        '글쓰기',
        style: TextStyle(color: BLACK_COLOR),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
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
          SizedBox(
            width: 58,
            height: 26,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], onPrimary: BLACK_COLOR),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return const PostBottomSheet();
                  },
                );
              },
              child: const Text('선택'),
            ),
          ),
        ],
      ),
    );
  }

  Padding ImageVideoSelected() {
    return Padding(
      padding: post_item_left_padding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '사진/동영상',
            style: co_create_middle_title,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 79.6,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return imagesWidgetList[index];
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 5);
                  },
                  // itemCount: imagesWidgetList.length,
                  itemCount: imagesWidgetList.length,
                ),
              ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Container addButton() {
    return Container(
      width: 79.6,
      height: 79.6,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          // image == null ? renderEmpty() :
          // onImageTap();
          _getImage();
        },
        icon: Icon(
          Icons.add,
          size: 40,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    imageFilesList.add(addButton());
    imagesWidgetList = imageFilesList.map((item) => item as Widget).toList();
  }

  List<int> iconButtonKeyIndexList = [];
  List<int> iconButtonKeyIndexReplaceList = [];


  /// 이미지 선택 했을 때 [imagesWidgetList]에 넣어서 화면에 뿌려주기
  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
      imageFilesList.add(_imageFile);

      final int currentImageIndex = imageFilesList.length - 1;

      imagesWidgetList.add(addImages(currentImageIndex));

      imageFilesList.length == 6 ? imageFilesList.removeAt(0) : null;
      imagesWidgetList.length == 6 ? imagesWidgetList.removeAt(0) : null;
    });
  }

  // 등록된 이미지
  Stack addImages(index) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          width: 79.6,
          height: 79.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(imageFilesList[index]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              // key: Key("$index"),
              onPressed: () {
                setState(() {
                  imageFilesList.removeAt(index);
                  imagesWidgetList.removeAt(index);

                  if (imageFilesList[0].runtimeType != addButton().runtimeType) {
                    imageFilesList.insert(0, addButton());
                    imagesWidgetList.insert(0, addButton());
                  }
                });
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 등록 버튼
  Padding RegisteredButton(BuildContext context) {
    return Padding(
      padding: big_long_button(),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
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
