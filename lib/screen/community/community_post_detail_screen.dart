import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class CommunityPostDetailScreen extends StatelessWidget {
  const CommunityPostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunityPostDetailAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    renderTitle(context),
                    renderUserInfo(context),
                    renderImage(context),
                    renderIcon(context),
                    renderContent(context),
                    suit_sized_box_style(),
                    renderCommentArea(context),
                  ],
                ),
              ),
            ),
            renderComment(context),
          ],
        ),
      ),
    );
  }

  AppBar CommunityPostDetailAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: WHITE_COLOR,
      title: Text(
        '게시글 상세',
        style: TextStyle(color: BLACK_COLOR),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, color: BLACK_COLOR),
      ),
    );
  }

  Padding renderTitle(BuildContext context) {
    return Padding(
      padding: post_item_left_padding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('자유', style: co_post_detail_category),
          SizedBox(
            width: 10,
          ),
          Text('뭉치 오늘 신났네~~', style: co_post_detail_title),
        ],
      ),
    );
  }

  Container renderUserInfo(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('asset/image/dog3.jpeg'),
                ),
                SizedBox(width: 10),
                Text('뭉치아빠', style: co_post_detail_user_nick),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
          ],
        ),
      ),
    );
  }

  Container renderImage(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: WHITE_COLOR,
            child: Image.asset(
              'asset/image/dog1.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Container renderIcon(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.pets)),
              Text(
                '좋아요 3개',
                style: co_post_detail_sub_text,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.near_me)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
            ],
          ),
        ],
      ),
    );
  }

  Padding renderContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        child: Text(
          '주말에 날씨가 좋아서 코에 바람좀 넣으라고 애견운동장 놀러왔어요~!! 친구들이랑 재밌게 노는것같아 기분 좋은 하루네요! ㅎㅎㅎㅎㅎ',
          style: co_post_detail_contetnt,
        ),
      ),
    );
  }

  Container renderCommentArea(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Center(
              child: Text('댓글창'),
            ),
          ),
        ],
      ),
    );
  }

  Container renderComment(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple,
            child: Center(
              child: Text('댓글'),
            ),
          ),
        ],
      ),
    );
  }
}
