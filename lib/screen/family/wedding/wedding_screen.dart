import 'package:flutter/material.dart';
import 'package:treepet/screen/family/wedding/wedding_list_post_screen.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_1.dart';
import 'package:treepet/screen/family/wedding/wedding_propose_list_post_screen.dart';
import '../../../const/color.dart';
import '../../../layout/screen_layout.dart';

class WeddingScreen extends StatefulWidget {
  const WeddingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WeddingScreen> createState() => _WeddingScreenState();
}

class _WeddingScreenState extends State <WeddingScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  bool isTextVisible = true;
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  late AnimationController _controller;
  late Animation<double> _heightFactorAnimation;

  List<WeddingProposeListPostScreen> itemList = [
    const WeddingProposeListPostScreen(
      imagePath: 'asset/image/treepetMale.jpeg',
      nickName: '야무진개발자',
      location: '서울시 구로구',
      receivedContent: "안녕하세요 저는 몽실이 보호자 야무진개발자 에요.",
      receivedDate: "18:98",
      readStatus: true,
    ),
    const WeddingProposeListPostScreen(
      imagePath: 'asset/image/treepetMale.jpeg',
      nickName: '야무진개발자',
      location: '서울시 구로구',
      receivedContent: "안녕하세요 저는 몽실이 보호자 야무진개발자 에요.",
      receivedDate: "18:98",
      readStatus: true,
    ),
    const WeddingProposeListPostScreen(
      imagePath: 'asset/image/treepetMale.jpeg',
      nickName: '야무진개발자',
      location: '서울시 구로구',
      receivedContent: "안녕하세요 저는 몽실이 보호자 야무진개발자 에요.",
      receivedDate: "18:98",
      readStatus: true,
    ),
    // 추가 항목들
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(context),
      body: ScreenLayout(
        title: 'Wedding',
        body: _WeddingScreenBody(),
        appBarBottom: _WeddingScreenAppBarBottom(),
        screenKey: 'wedding',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
      reverseDuration: const Duration(milliseconds: 100000),
    );
    _heightFactorAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleExpand1() {
    setState(() {
      _isExpanded1 = !_isExpanded1;
      if (_isExpanded1) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void toggleExpand2() {
    setState(() {
      _isExpanded2 = !_isExpanded2;
      if (_isExpanded2) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  TabBarView _WeddingScreenBody() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _WeddingListPost(),
        _ProposeListPost(),
      ],
    );
  }

  TabBar _WeddingScreenAppBarBottom() {
    return TabBar(
      controller: _tabController,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      labelColor: Colors.black,
      tabs: const [
        Tab(text: "신랑&신부 찾기"),
        Tab(text: "프로포즈 List"),
      ],
    );
  }

  Scrollbar _WeddingListPost() {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Column(
            children: const [
              WeddingListPost(
                title: '예쁘디 예쁜 우리 예삐 신랑찾아요~!',
                nickName: '야무진개발자',
                location: '서울 은평구',
                petKind: "강아지",
                petVariety: '비숑',
                petGender: '수컷',
                petAge: 1,
                petWeight: 1.6,
                comment: 245,
              ),
            ],
          );
        },
      ),
    );
  }

  Scrollbar _ProposeListPost() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('프로포즈 받은 목록'),
              onTap: toggleExpand1,
              // contentPadding: EdgeInsets.zero,
            ),
            AnimatedSize(
              vsync: this,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: _isExpanded1 ? null : 0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = itemList[index];
                    bool isDeleting = false;

                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          itemList.removeAt(index);
                        });
                      },
                      confirmDismiss: (direction) => _confirmDismiss(direction, context, index),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        children: [
                          WeddingProposeListPostScreen(
                            imagePath: itemList[index].imagePath,
                            nickName: itemList[index].nickName,
                            location: itemList[index].location,
                            receivedContent: itemList[index].receivedContent,
                            receivedDate: itemList[index].receivedDate,
                            readStatus: itemList[index].readStatus,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text('프로포즈 보낸 목록'),
              onTap: toggleExpand2,
            ),
            AnimatedSize(
              vsync: this,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: _isExpanded2 ? null : 0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: const [
                        WeddingProposeListPostScreen(
                          imagePath: 'asset/image/treepetFemale.jpeg',
                          nickName: '규상어',
                          location: '서울시 은평구',
                          receivedContent: "안녕하세요 저는 보구밍 보호자 규상어 에요.",
                          receivedDate: '02월 05일',
                          readStatus: false,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

    Future<bool> _confirmDismiss(
      DismissDirection direction,
      BuildContext context,
      int index,
      ) {
    if (direction == DismissDirection.endToStart) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('프로포즈 받은 메시지 삭제'),
              content: Text('${itemList[index].nickName}님의 메시지를 삭제하시겠습니까?'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    return Navigator.of(context).pop(false);
                  },
                  child: const Text('취소'),
                ),
                ElevatedButton(
                  onPressed: () {
                    return Navigator.of(context).pop(true);
                  },
                  child: const Text('삭제'),
                ),
              ],
            );
          }).then((value) => Future.value(value));
    } else if (direction == DismissDirection.startToEnd) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: Text('Now saving ${itemList[index]}'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    return Navigator.of(context).pop(false);
                  },
                  child: const Text('CANCEL'),
                ),
                ElevatedButton(
                  onPressed: () {
                    return Navigator.of(context).pop(true);
                  },
                  child: const Text('SAVE'),
                ),
              ],
            );
          }).then((value) => Future.value(value));
    }
    return Future.value(false);
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const WeddingPostCreateScreen1()));
      },
      backgroundColor: MAIN_COLOR,
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
