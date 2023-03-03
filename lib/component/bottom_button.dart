import 'package:flutter/material.dart';
import 'package:treepet/const/style.dart';

/// 등록 화면의 [BottomAppBar], "다음" [button]으로 [nextPage]로 이동
Widget BottomAppBarButton(BuildContext context, String buttonName, nextPage, [Map<String,bool>? checkMap]) {
  return BottomAppBar(
    child: SizedBox(
      height: 60.0,
      child: GestureDetector(
        onTap: () {
          bool? allValuesAreTrue = checkMap?.values.every((value) => value == true);

          if (checkMap == null) allValuesAreTrue = true;

          if (allValuesAreTrue != null && allValuesAreTrue) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => nextPage,
              ),
            );
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