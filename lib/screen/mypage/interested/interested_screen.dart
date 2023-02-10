import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class InterestedScreen extends StatelessWidget {
  const InterestedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: SettingInterestedScreenAppBar(context),
        body: TabBarView(
          children: [
            Column(
              children: [
                Text('11111'),
                Text('11112'),
                Text('11113'),
              ],
            ),
            Column(
              children: [
                Text('22221'),
                Text('22222'),
                Text('22223'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar SettingInterestedScreenAppBar(BuildContext context) {
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
        '관심있는 친구',
        style: TextStyle(color: BLACK_COLOR),
      ),
      bottom: TabBar(
        labelColor: Colors.black,
        labelStyle: interested_tabbar,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: MAIN_COLOR,
        tabs: [
          Tab(
            text: "웨딩",
          ),
          Tab(
            text: "입양/분양",
          ),
        ],
      ),
    );
  }
}
