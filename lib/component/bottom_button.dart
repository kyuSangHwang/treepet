import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/community/community_screen.dart';
import 'package:treepet/screen/family/family_screen.dart';
import 'package:treepet/screen/mypage/mypage_screen.dart';
import 'package:treepet/screen/sign/sign_up_term_agree_screen.dart';

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

// class MyBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   List<Widget> _widgetOptions = [
//     FamilyScreen(),
//     Text('우리가족'),
//     CommunityScreen(),
//     SignUpTermAgreeScreen(),
//     MyPageScreen(),
//   ];
//
//   MyBottomNavigationBar({required this.currentIndex, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: onTap,
//       items: [
//         BottomNavigationBarItem(
//             icon: currentIndex == 0
//                 ? Icon(Icons.search, color: MAIN_COLOR)
//                 : Icon(Icons.search, color: SECOND_COLOR),
//             label: '가족만들기'),
//         BottomNavigationBarItem(
//             icon: currentIndex == 1
//                 ? Icon(Icons.search, color: MAIN_COLOR)
//                 : Icon(Icons.search, color: SECOND_COLOR),
//             label: '우리가족'),
//         BottomNavigationBarItem(
//             icon: currentIndex == 2
//                 ? Icon(Icons.commute, color: MAIN_COLOR)
//                 : Icon(Icons.commute, color: SECOND_COLOR),
//             label: '커뮤니티'),
//         BottomNavigationBarItem(
//             icon: currentIndex == 3
//                 ? Icon(Icons.shopping_bag, color: MAIN_COLOR)
//                 : Icon(Icons.shopping_bag, color: SECOND_COLOR),
//             label: '쇼핑몰'),
//         BottomNavigationBarItem(
//             icon: currentIndex == 4
//                 ? Icon(Icons.person, color: MAIN_COLOR)
//                 : Icon(Icons.person, color: SECOND_COLOR),
//             label: '마이페이지'),
//       ],
//       showSelectedLabels: false, // 아이콘 아래에 라벨 안 보이게 하기 위해 false
//       showUnselectedLabels: false,
//       type: BottomNavigationBarType.fixed, // 아이콘 클릭시 이벤트 발생 안되게 fixed
//     );
//   }
// }