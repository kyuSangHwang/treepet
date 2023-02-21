import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treepet/component/wedding_component.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/family/wedding/wedding_screen.dart';

class MyHomePage11 extends StatefulWidget {
  @override
  State<MyHomePage11> createState() => _MyHomePage11State();
}

class _MyHomePage11State extends State<MyHomePage11> {
  late File _imageFile = File(" ");
  List<dynamic> imageFilesList = [];
  List<Widget> imagesWidgetList = [];
  Map<String, bool> checkedList = {
    "checkContent1" : false,
    "checkContent2" : false,
  };

  @override
  void initState() {
    super.initState();
    imageFilesList.add(addButton());
    imagesWidgetList = imageFilesList.map((item) => item as Widget).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeddingPostCreateAppBar(context),
      body: WeddingPostCreateScreen4Body(),
      bottomNavigationBar:
          WeddingBottomAppBarButton(context, "완 료", const WeddingScreen(), checkedList),
    );
  }

  /// 반려동물 웨딩 등록 시 보여지는 세 번째 화면의 내용
  GestureDetector WeddingPostCreateScreen4Body() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const WeddingCreateTitleForm(),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    petIntroduce(context),
                    addImage(),
                    checkList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 이미지 선택 했을 때 [imagesWidgetList]에 넣어서 화면에 뿌려주기
  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
      imageFilesList.add(_imageFile);
      imagesWidgetList.add(addImages(imageFilesList.length-1));
    });
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

  Container addImages(index) {
    return Container(
      height: 10,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(imageFilesList[index]),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  /// 반려동물 웨딩 등록 시 자기소개 영역
  Row petIntroduce(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryTitle("자기 소개"),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 180.0,
                child: TextFormField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: '로미를 소개해주세요!',
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.green,
                  style: wedding_post_detail_135_300_014,
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ],
    );
  }

  /// 반려동물 웨딩 등록 시 이미지 추가하는 영역
  Row addImage() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryTitle("이미지 추가하기"),
            const SizedBox(height: 8.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 79.6,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: imagesWidgetList.map((e) => e,).toList(),
              ),
            ),
            const SizedBox(height: 25.0),
          ],
        ),
      ],
    );
  }

  /// 반려동물 웨딩 등록 시 확인사항 및 주의사항 확인하는 영역
  Row checkList() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryTitle("웨딩 등록 시 확인 사항 및 주의사항", 250),
            const SizedBox(height: 8.0),
            checkListContents('작성하신 내용이 모두 사실인가요?', 1),
            checkListContents('내용 중 거짓이 있으면 위증의 벌을 받습니다.', 2),
          ],
        ),
      ],
    );
  }

  /// 확인사항 및 주의사항 내용
  ///
  /// [content] String, 확인사항 및 주의사항 내용.
  /// [mapIndex] int, checkList Index
  SizedBox checkListContents(String content, int mapIndex) {
    return SizedBox(
      height: 30.0,
      child: Row(
        children: [
          Text(content),
          Checkbox(
            value: checkedList["checkContent$mapIndex"],
            onChanged: (bool? value) {
              setState(() {
                checkedList["checkContent$mapIndex"] = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }


}
