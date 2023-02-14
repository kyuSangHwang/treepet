import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class followListModel {
  final String userNick;
  final String petName;

  followListModel({
    required this.userNick,
    required this.petName,
  });
}

class FollowListScreen extends StatefulWidget {
  int selectedIndex;

  FollowListScreen({required this.selectedIndex, Key? key}) : super(key: key);

  @override
  State<FollowListScreen> createState() => _FollowListScreenState();
}

class _FollowListScreenState extends State<FollowListScreen>
    with SingleTickerProviderStateMixin {
  bool _visible = true;
  TabController? _tabController;
  int? selectedIndex;

  final followList = [
    followListModel(userNick: '망치부인', petName: '망치'),
    followListModel(userNick: '인생지사', petName: '오이'),
    followListModel(userNick: '뭉뭉이좋아', petName: '망망이'),
    followListModel(userNick: '로사로이', petName: '로사'),
    followListModel(userNick: '무이야', petName: '무이'),
  ];

  final followerList = [
    followListModel(userNick: '망치부인22', petName: '망치'),
    followListModel(userNick: '인생지사222', petName: '오이'),
    followListModel(userNick: '뭉뭉이좋아22', petName: '망망이'),
  ];

  // TODO : 좌우 스크롤로 화면 전환시 화면이 바뀌지않는다
  @override
  void initState() {
    super.initState();
    // vsync: this 를 사용하려면 State에 (with SingleTickerProviderStateMixin)를 사용해야한다
    _tabController = TabController(
        initialIndex: widget.selectedIndex, vsync: this, length: 2);
    _tabController!.addListener(_handleTabSelection);
  }


  void _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      // 현재 탭이 변경되고 있다면
      setState(() {
        selectedIndex = _tabController!.index;
      });
    }
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabSelection);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.selectedIndex == 0 ? 0 : 1,
      length: 2,
      child: Scaffold(
        appBar: FollowListScreenAppBar(context),
        body: TabBarView(
          controller: _tabController,
          children: [
            FollowerList(),
            FollowList(),
            // widget.selectedIndex == 0 ? FollowerList() : FollowList(),
          ],
        ),
      ),
    );
  }

  AppBar FollowListScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
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
        '뭉치아빠',
        style: TextStyle(color: BLACK_COLOR),
      ),
      bottom: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        labelStyle: follow_tabbar,
        indicatorColor: MAIN_COLOR,
        onTap: _onTabSelected,
        tabs: [
          Tab(text: '팔로워 3명'),
          Tab(text: '팔로우 5명'),
        ],
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      widget.selectedIndex = index;
      widget.selectedIndex == 0 ? FollowerList() : FollowList();
    });
    _tabController?.animateTo(index);
  }

  ListView FollowList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return RenderFollowListPerson(context, index);
      },
      itemCount: 1,
    );
  }

  ListView FollowerList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return RenderFollowListPerson(context, index);
      },
      itemCount: 1,
    );
  }

  Widget RenderFollowListPerson(context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: (widget.selectedIndex == 0 ? followerList : followList)
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
                                  person.userNick,
                                  style: follow_list_user_nick,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  person.petName,
                                  style: follow_list_pet_name,
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
                          '팔로잉',
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
