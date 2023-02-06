import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/mypage/settings/event/event_post_detail_screen.dart';

class eventModel {
  final String title;
  final int startTime;
  final int endTime;

  eventModel({
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}

class SettingsEventListScreen extends StatelessWidget {
  final eventPost = [
    eventModel(
        title: '1111트리펫 MVP 오픈했습니다~! 모두 축하해주세요~!',
        startTime: 20230206,
        endTime: 2023010),
    eventModel(title: '2222 반려동물과 찰칵', startTime: 20230206, endTime: 2023010),
    eventModel(
        title: '3333 오늘도 내일도 산책하자', startTime: 20230206, endTime: 2023010),
    eventModel(title: '4444 치카치카 양치데이', startTime: 20230206, endTime: 2023010),
  ];

  SettingsEventListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingEventScreenAppBar(context),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return RenderEventPost(context);
        },
      ),
    );
  }

  AppBar SettingEventScreenAppBar(BuildContext context) {
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
        '이벤트',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderEventPost(BuildContext context) {
    return Column(
      children: eventPost.reversed
          .map(
            (post) => GestureDetector(
              onTap: () {
                print('안클릭클릭녕');
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EventPostDetailScreen()));
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 295,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage(
                          'asset/image/postTest1.jpg',
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          post.title,
                          style: event_title,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '이벤트 기간',
                            style: event_time_name,
                          ),
                          SizedBox(width: 20),
                          Text(
                            post.startTime.toString(),
                            style: event_time_concent,
                          ),
                          Text(
                            ' ~ ',
                            style: event_time_concent,
                          ),
                          Text(
                            post.endTime.toString(),
                            style: event_time_concent,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '이벤트 종료',
                            style: event_time_name,
                          ),
                          SizedBox(width: 20),
                          Text(
                            '2022.12.30',
                            style: event_time_concent,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
