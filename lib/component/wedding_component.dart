import 'package:flutter/material.dart';
import 'package:treepet/const/style.dart';

/// 반려동물 웨딩 등록 화면의 화면 [Title] 영역
class WeddingCreateTitleForm extends StatelessWidget {
  const WeddingCreateTitleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          '신랑&신부 정보',
          style: wedding_post_22_400_012,
        ),
      ),
    );
  }
}

/// 반려동물 웨딩 등록 화면의 [AppBar]
AppBar WeddingPostCreateAppBar(BuildContext context, String appBarTitle) {
  return AppBar(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.white,
    title: Text(
      appBarTitle,
      style: const TextStyle(color: Colors.black),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
  );
}

/// 반려동물 웨딩 등록 화면의 [BottomAppBar], "다음" [button]으로 [nextPage]로 이동
Widget WeddingBottomAppBarButton(BuildContext context, String buttonName, nextPage, [Map<String,bool>? checkMap]) {
  return BottomAppBar(
    child: SizedBox(
      height: 60.0,
      child: GestureDetector(
        onTap: () {
          bool? allValuesAreTrue = checkMap?.values.every((value) => value == true);

          if (checkMap == null) allValuesAreTrue = true;

          if (allValuesAreTrue != null && allValuesAreTrue) {
              if(buttonName == "완 료" || buttonName == "프로포즈 신청하기" || buttonName == "확 인") {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => nextPage,
                  ),(route) => false
                );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => nextPage,
                  ),
                );
              }
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('웨딩 등록 시 확인사항 및 주의사항을\n모두 체크해주세요'),
                  actions: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        child: const Text('확인'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                );
              },
            );

          }
        },
        child: Container(
          width: double.infinity,
          color: Colors.grey,
          child: Center(
            child: Text(
              buttonName,
              style: wedding_post_create_20_400_012,
            ),
          ),
        ),
      ),
    ),
  );
}

/// 카테고리 제목을 넣어주는 Widget.
///
/// [categoryTitle] String, 카테고리 제목.
/// [newWidth] double?, default 넓이가 아닌 넗이.
/// [newHeight] double?, default 높이가 아닌 높이.
///
/// 카테고리 제목을 받아서 사이즈를 지정 후 return.
SizedBox categoryTitle(String categoryTitle, [double? newWidth,  double? newHeight]) {
  return SizedBox(
    width: newWidth ?? 100.0,
    height: newHeight ?? 22.0,
    child: Text(
      categoryTitle,
      style: wedding_post_15_400_012,
    ),
  );
}