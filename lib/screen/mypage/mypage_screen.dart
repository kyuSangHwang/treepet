import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/mypage/activity/activity_detail_screen.dart';
import 'package:treepet/screen/mypage/follow/follow_list_screen.dart';
import 'package:treepet/screen/mypage/interested/interested_screen.dart';
import 'package:treepet/screen/mypage/petTree/pet_tree_view_all.dart';
import 'package:treepet/screen/mypage/settings/settings_screen.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyPageScreenAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfileInfo(context),
            SizedBox(height: 40),
            ProfileContent(context),
            Divider(height: 40),
            ProfilePetTree(context),
            ProfileSideMenu(context),
            SizedBox(height: 20),
            suit_sized_box_style(),
            ProfileDiary(context),
          ],
        ),
      ),
    );
  }

  AppBar MyPageScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      title: Text(
        '마이페이지',
        style: TextStyle(color: BLACK_COLOR),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SettingsScreen()));
          },
          icon: Icon(
            Icons.settings,
            color: BLACK_COLOR,
          ),
        ),
      ],
    );
  }

  // 프로필 유저 소개 부분 (회원 이미지, 팔로우, 회원 아이디, 회원 소개)
  Widget ProfileInfo(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('asset/image/dog3.jpeg'),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('육아일기'),
                    Text('3'),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => FollowListScreen(selectedIndex: 0)));
                      },
                      child: Text('팔로워'),
                    ),
                    Text('20'),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => FollowListScreen(selectedIndex: 1)));
                      },
                      child: Text('팔로우'),
                    ),
                    Text('28'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('뭉치아빠'),
              SizedBox(height: 10),
              Text('안녕하세요~! 산책하다가 감자를 마주치면 반갑게 인사해주세요~! 뭉치는 3살 리트리버 아이예요~!'),
            ],
          ),
        ],
      ),
    );
  }

  Widget ProfileContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('감자를 위한 공부 진행도 38%'),
              GestureDetector(
                onTap: () {
                  print('자세히 보기 클릭');
                },
                child: Text('자세히 보기'),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            color: BLACK_COLOR,
            width: MediaQuery.of(context).size.width,
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget ProfilePetTree(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('뭉치아빠의 가족들'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => PetTreeViewAll()));
                },
                child: Text('전체보기'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: BLACK_COLOR),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                // 내 반려동물
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('뭉치'),
                                Row(
                                  children: [Text('말티즈'), Icon(Icons.man)],
                                ),
                                Row(
                                  children: [
                                    Text('여아'),
                                    Text('2살'),
                                    Text('3kg'),
                                    Text('중성화 O'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.settings_ethernet)
                    ],
                  ),
                ),
                // TODO : 가로로 되긴 하는데 가족당 가로 넓이에 문제가 있는듯...
                Divider(height: 5),
                // 내 반려동물 가족
                Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(),
                              SizedBox(height: 10),
                              Text('로미'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(),
                              SizedBox(height: 10),
                              Text('로미'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 40),
        ],
      ),
    );
  }

  Widget ProfileSideMenu(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        children: [
          // 활동내역 타이틀
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ActivityDetailScreen()));
            },
            child: Row(
              children: [
                Icon(Icons.schedule),
                SizedBox(
                  width: 10,
                ),
                Text('활동내역'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => InterestedScreen()));
            },
            child: Row(
              children: [
                Icon(Icons.schedule),
                SizedBox(
                  width: 10,
                ),
                Text('내가 관심있는 친구'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ProfileDiary(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Text('육아일기'),
            ],
          ),
          SizedBox(height: 20),
          //TODO : 마이페이지쪽 육아일기 UI
          renderBuilder(),
          // ListView.builder(
          //   itemBuilder: (BuildContext context, int index) {
          //     return renderBuilder();
          //   },
          // ),
        ],
      ),
    );
  }

  // 화면에 보이는것만 그림
  Widget renderBuilder() {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
      ),
      // 데이터 갯수
      itemCount: 13,
      itemBuilder: (context, index) {
        return renderContainer(
          color: BLACK_COLOR,
          index: index,
        );
      },
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    return Container(
      height: height ?? 300,
      color: color,
    );
  }
}
