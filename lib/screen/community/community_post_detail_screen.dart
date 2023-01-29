import 'package:flutter/material.dart';
import 'package:treepet/layout/screen_layout.dart';

class CommunityPostDetailScreen extends StatelessWidget {
  const CommunityPostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: '게시글 상세',
      body: Scaffold(
        body: Text('상세페이지'),
      ),
    );
  }
}