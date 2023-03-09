import 'package:flutter/material.dart';
import 'package:treepet/component/treepet_bottom_navigation_bar.dart';
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
      bottomNavigationBar: TreepetBottomNavigationBar(indexValueChanged: tesx, selectedIndex: _selectedIndex),
    );
  }

  void tesx(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

}
