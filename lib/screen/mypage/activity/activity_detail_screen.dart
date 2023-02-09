import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: SettingActivityDetailScreenAppBar(context),
        body: TabBarView(
          children: [
            RenderActivityCategoryOfCategory(),
            RenderActivityCategoryOfCategory(),
            RenderActivityCategoryOfCategory(),
            RenderActivityCategoryOfCategory(),
            RenderActivityCategoryOfCategory(),
            RenderActivityCategoryOfCategory(),
          ],
        ),
      ),
    );
  }

  AppBar SettingActivityDetailScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: BLACK_COLOR,
        ),
      ),
      title: Text(
        '활동내역',
        style: TextStyle(color: BLACK_COLOR),
      ),
      bottom: TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        labelStyle: activity_first_tabbar,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: MAIN_COLOR,
        tabs: [
          Tab(text: "웨딩"),
          Tab(text: "입양/분양"),
          Tab(text: "자유게시판"),
          Tab(text: "육아일기"),
          Tab(text: "질문방"),
          Tab(text: "찾아주세요"),
        ],
      ),
    );
  }

  // labelColor: Colors.black,
  // labelStyle: activity_first_tabbar,
  // indicatorSize: TabBarIndicatorSize.tab,
  // indicatorColor: MAIN_COLOR,

  Widget RenderActivityCategoryOfCategory() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: WHITE_COLOR,
          toolbarHeight: 0.0,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.black,
            labelStyle: activity_first_tabbar,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: MAIN_COLOR,
            tabs: [
              Tab(text: "작성글"),
              Tab(text: "댓글 단 글"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ForthTab(),
            FifthTab(),
          ],
        ),
      ),
    );
  }
}

class ForthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class FifthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}