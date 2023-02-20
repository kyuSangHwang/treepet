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
AppBar WeddingPostCreateAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.white,
    title: const Text(
      '신랑&신부 등록',
      style: TextStyle(color: Colors.black),
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
BottomAppBar WeddingBottomAppBarButton(BuildContext context, nextPage) {
  return BottomAppBar(
    child: SizedBox(
      height: 60.0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => nextPage,
            ),
          );
        },
        child: Container(
          width: double.infinity,
          color: Colors.grey,
          child: const Center(
            child: Text(
              '다 음',
              style: wedding_post_create_20_400_012,
            ),
          ),
        ),
      ),
    ),
  );
}