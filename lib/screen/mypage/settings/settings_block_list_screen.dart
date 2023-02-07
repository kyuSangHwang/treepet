import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class blockListModel {
  final String title;
  final int time;

  blockListModel({
    required this.title,
    required this.time,
  });
}

class SettingsBlockListScreen extends StatefulWidget {
  SettingsBlockListScreen({Key? key}) : super(key: key);

  @override
  State<SettingsBlockListScreen> createState() =>
      _SettingsBlockListScreenState();
}

class _SettingsBlockListScreenState extends State<SettingsBlockListScreen> {
  bool _visible = true;
  final blockList = [
    blockListModel(title: '망치부인', time: 20230207),
    blockListModel(title: '인생지사', time: 20230207),
    blockListModel(title: '뭉뭉이좋아', time: 20230207),
    blockListModel(title: '로사로이', time: 20230207),
    blockListModel(title: '무이야', time: 20230207),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingBlockListScreenAppBar(context),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return RenderBlockListPerson(context, index);
        },
        itemCount: 1,
      ),
    );
  }

  AppBar SettingBlockListScreenAppBar(BuildContext context) {
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
        '차단 목록',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderBlockListPerson(context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: blockList
            .map(
              (person) => Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('asset/image/dog1.jpeg'),
                              radius: 23,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  person.title,
                                  style: block_list_nick,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  person.time.toString(),
                                  style: block_list_day,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            print(index);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '차단 해제',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(height: 0),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}