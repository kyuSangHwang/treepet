import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/layout/screen_layout.dart';
import 'package:treepet/screen/community/community_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 아이콘이 클릭되었을 때 보여줄 widget 화면.
  // 첫 아이콘(홈)에만 Text를 넣어주고 나머는 Placeholder(임시 위젯)을 넣었다.
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    Text('가족만들기'),
    Text('우리가족'),
    CommunityScreen(),
    Text('쇼핑몰'),
    Text('마이페이지'),
  ];

  // 아이콘이 클릭되었을 때의 이벤트 리스너
  // 클릭된 인덱스로 _selectedIndex에 할당하고 build 함수를 호출한다(setState)
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body에 넣어줄 아이템
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // 현재 아이콘이 선택된 아이콘일때와 선택된 아이콘이 아닌 경우 Icon을 다르게 하기 위함
          BottomNavigationBarItem(icon: _selectedIndex == 0 ? Icon(Icons.search, color: MAIN_COLOR) : Icon(Icons.search, color: SECOND_COLOR), label: '가족만들기'),
          BottomNavigationBarItem(icon: _selectedIndex == 1 ? Icon(Icons.search, color: MAIN_COLOR) : Icon(Icons.search, color: SECOND_COLOR), label: '우리가족'),
          BottomNavigationBarItem(icon: _selectedIndex == 2 ? Icon(Icons.commute, color: MAIN_COLOR) : Icon(Icons.commute, color: SECOND_COLOR), label: '커뮤니티'),
          BottomNavigationBarItem(icon: _selectedIndex == 3 ? Icon(Icons.shopping_bag, color: MAIN_COLOR) : Icon(Icons.shopping_bag, color: SECOND_COLOR), label: '쇼핑몰'),
          BottomNavigationBarItem(icon: _selectedIndex == 4 ? Icon(Icons.person, color: MAIN_COLOR) : Icon(Icons.person, color: SECOND_COLOR), label: '마이페이지'),
        ],
        onTap: _onItemTapped,
        // 아이콘 아래에 라벨 안보이게 하기 위해 false
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // 아이콘 클릭시 이벤트 발생 안되게 fixed
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
