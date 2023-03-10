import 'package:flutter/material.dart';
import 'package:treepet/component/treepet_bottom_navigation_bar.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/layout/screen_layout.dart';
import 'package:treepet/screen/community/community_screen.dart';
import 'package:treepet/screen/sign/sign_up_term_agree_screen.dart';
import 'family/family_screen.dart';
import 'package:treepet/screen/mypage/mypage_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 아이콘이 클릭되었을 때 보여줄 widget 화면.
  // 첫 아이콘(홈)에만 Text를 넣어주고 나머는 Placeholder(임시 위젯)을 넣었다.
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const FamilyScreen(),
    const Text('우리가족'),
    CommunityScreen(),
    const SignUpTermAgreeScreen(),
    const MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // body에 넣어줄 아이템
      ),
      bottomNavigationBar: TreepetBottomNavigationBar(),
    );
  }

  BottomNavigationBar TreepetBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.search, color: MAIN_COLOR)
                : const Icon(Icons.search, color: SECOND_COLOR),
            label: '가족만들기'),
        BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.search, color: MAIN_COLOR)
                : const Icon(Icons.search, color: SECOND_COLOR),
            label: '우리가족'),
        BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.commute, color: MAIN_COLOR)
                : const Icon(Icons.commute, color: SECOND_COLOR),
            label: '커뮤니티'),
        BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(Icons.shopping_bag, color: MAIN_COLOR)
                : const Icon(Icons.shopping_bag, color: SECOND_COLOR),
            label: '쇼핑몰'),
        BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? const Icon(Icons.person, color: MAIN_COLOR)
                : const Icon(Icons.person, color: SECOND_COLOR),
            label: '마이페이지'),
      ],
      onTap: _onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
