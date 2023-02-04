import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class announcementModel {
  final String title;
  final String time;

  announcementModel({
    required this.title,
    required this.time,
  });
}

class SettingsAnnouncementListScreen extends StatelessWidget {
  final announcementPost = [
    announcementModel(title: '트리펫 MVP 테스트 오픈', time: '2023.02.05'),
    announcementModel(title: '트리펫 MVP 테스트 오픈', time: '2023.02.05'),
    announcementModel(title: '트리펫 MVP 테스트 오픈', time: '2023.02.05'),
    announcementModel(title: '트리펫 MVP 테스트 오픈', time: '2023.02.05'),
  ];

  SettingsAnnouncementListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAnnouncementScreenAppBar(context),
      body: ListView.builder(
        itemCount: announcementPost.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              RenderAnnouncementPost(context),
            ],
          );
        },
      ),
    );
  }

  AppBar SettingAnnouncementScreenAppBar(BuildContext context) {
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
        '공지사항',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderAnnouncementPost(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (0.92),
      child: Column(
        children: announcementPost
            .map(
              (post) => GestureDetector(
                onTap: (){
                  print('안클릭클릭녕');
                },
                behavior: HitTestBehavior.opaque,
                child: ListTile(
                  leading: Text(post.title),
                  trailing: Text(post.time),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// Widget RenderAnnouncementPost(BuildContext context) {
//   return GestureDetector(
//     onTap: (){
//       print('클릭클릭');
//       print(announcementPost.length);
//     },
//     child: SizedBox(
//       width: MediaQuery.of(context).size.width * 0.92,
//       child: Column(
//           children: announcementPost
//               .map(
//                 (post) => Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   child: Text(
//                     post.title,
//                     style: announcement_title,
//                   ),
//                 ),
//                 SizedBox(height: 70,),
//                 SizedBox(
//                   child: Text(
//                     post.time,
//                     style: announcement_concent,
//                   ),
//                 ),
//               ],
//             ),
//           )
//               .toList()),
//     ),
//   );
// }
