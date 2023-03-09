import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/screen/community/community_screen.dart';
import 'package:treepet/screen/family/family_screen.dart';
import 'package:treepet/screen/mypage/mypage_screen.dart';
import 'package:treepet/screen/sign/sign_up_term_agree_screen.dart';

class TreepetBottomNavigationBar extends StatefulWidget {
  void Function(int indexValue)? indexValueChanged;
  int selectedIndex;

  TreepetBottomNavigationBar({
    this.indexValueChanged,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<TreepetBottomNavigationBar> createState() => _TreepetBottomNavigationBarState();
}

class _TreepetBottomNavigationBarState extends State<TreepetBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 0
                ? const Icon(Icons.search, color: MAIN_COLOR)
                : const Icon(Icons.search, color: SECOND_COLOR),
            label: '가족만들기'),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 1
                ? const Icon(Icons.search, color: MAIN_COLOR)
                : const Icon(Icons.search, color: SECOND_COLOR),
            label: '우리가족'),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 2
                ? const Icon(Icons.commute, color: MAIN_COLOR)
                : const Icon(Icons.commute, color: SECOND_COLOR),
            label: '커뮤니티'),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 3
                ? const Icon(Icons.shopping_bag, color: MAIN_COLOR)
                : const Icon(Icons.shopping_bag, color: SECOND_COLOR),
            label: '쇼핑몰'),
        BottomNavigationBarItem(
            icon: widget.selectedIndex == 4
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
      widget.selectedIndex = index;
      widget.indexValueChanged!(widget.selectedIndex);
    });
  }
}
