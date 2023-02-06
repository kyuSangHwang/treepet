import 'package:flutter/material.dart';
import 'package:treepet/screen/family/wedding/wedding_screen.dart';
import '../../../component/more_screen.dart';
import '../../../const/style.dart';

class WeddingPostDetailScreen extends StatefulWidget {
  const WeddingPostDetailScreen({Key? key}) : super(key: key);

  @override
  State<WeddingPostDetailScreen> createState() =>
      _WeddingPostDetailScreenState();
}

class _WeddingPostDetailScreenState extends State<WeddingPostDetailScreen> {
  final List<Image> _data = [Image.asset('asset/image/dog1.jpeg')];

  final String introduceContent =
      "이번이 첫 교배 이구요. 발랄 활달하고 개구장이 같은 성격입니다. 아직 꽃 도장 전이고 미리 구하는 거에용~ 신랑 쪽이 교배 경험 있었으면 좋겠습니다(없어도 상관없음) 저희 아이가 작아서 신랑이 너무 크면 아이가 힘들 것 같아서 신랑 크기가 2키로는 안 넘었으면 좋겠어요~작으면 작을수록 좋을 것 같아요 저희 아이 몸무게는1.8정도 됩니다 짖음도 1도 없고 입질도 없어요 진짜 완전 순둥이 입니다🥰 사진은 애기 때 사진이라 눈물자국이 좀 있는데  지금은 없어용~!ㅎㅎ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  '예쁘디 예쁜 우리 몽실이 신부찾아요~!',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              background: Image.asset(
                'asset/image/mongSil.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
            // child: Center(
            //   child: Text('Scroll to see the SliverAppBar in effect.'),
            // ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  // 회원정보 영역
                  // TODO: topRight, topLeft 모서리 둥글게 하기 decoration 안됨 (KS)
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const WeddingScreen()));
                              },
                              iconSize: 40,
                              icon: const CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('asset/image/jaeHoon.png'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '야무진개발자',
                                  style: wedding_post_detail_15_500_012,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                      size: 14,
                                    ),
                                    Text(
                                      '서울시 은평구',
                                      style: wedding_post_detail_13_300_012,
                                    ),
                                    SizedBox(width: 4.0),
                                    Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 14,
                                    ),
                                    Text(
                                      '125',
                                      style: wedding_post_detail_13_300_012,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          // 더보기 Button
                          onPressed: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                context: context,
                                builder: (_) => const MoreScreen());
                          },
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // 신랑소개 영역
                  color: Colors.white,
                  // height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '신랑소개',
                          style: wedding_post_detail_18_500_012,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          introduceContent,
                          style: wedding_post_detail_14_300_015,
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          height: 10,
                          color: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '신랑정보',
                          style: wedding_post_detail_18_500_012,
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '이름',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '몽실이',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '종/품종',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '강아지/푸들',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '성별/나이',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.male,
                                size: 15.0,
                              ),
                              SizedBox(width: 3),
                              Text(
                                '1년 6개월 (만 1살)',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '몸무게/털색',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '1.6kg / 흰색',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '병력',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '감기, 슬개골 탈구, 광견병',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '알레르기',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '오이, 감자, 오리고기, 소고기, 빙어, 가지, 생선',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '희망장소',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '상관없음',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 80,
                                child: Text(
                                  '혈통서 유무',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '상관없음',
                                style: wedding_post_detail_13_300_012,
                              ),
                              _buildPanel(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '털빠짐 정도',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '몽실이',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '친화력 정도',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '몽실이',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '낮가림 정도',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '몽실이',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  '짖음 정도',
                                  style: wedding_post_detail_14_400_012,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '몽실이',
                                style: wedding_post_detail_13_300_012,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 10,
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _Footer(),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {});
      },
      children: _data.map<ExpansionPanel>((Image img) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const Text('title');
          },
          body: ListTile(
            title: Image.asset('asset/image/dog1.jpeg'),
          ),
          isExpanded: true,
        );
      }).toList(),
    );
  }
}

class _Footer extends StatefulWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  State<_Footer> createState() => _FooterState();
}

class _FooterState extends State<_Footer> {
  int _likeCnt = 0;
  bool _likeCntCheck = false;
  bool _bookMarkCheck = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: OverflowBar(
          overflowAlignment: OverflowBarAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () {
                            print(
                              '프로포즈 신청!',
                            );
                          },
                          child: const Text(
                            '프로포즈 신청하기',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: _incrementLikeCounter,
                                icon: (_likeCntCheck
                                    ? const Icon(Icons.favorite,
                                        color: Colors.redAccent)
                                    : const Icon(Icons.favorite_border)),
                              ),
                              Text(
                                _likeCnt.toString(),
                              ),
                            ],
                          ),
                          const SizedBox(width: 15.0),
                          const VerticalDivider(
                            //TODO: VerticalDivider 가 화면에 보이지 않음 (KS)
                            thickness: 10,
                            width: 5,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.chat_bubble_outline),
                              ),
                              const Text('53'),
                            ],
                          ),
                          const SizedBox(width: 15.0),
                          const VerticalDivider(
                            //TODO: VerticalDivider 가 화면에 보이지 않음 (KS)
                            thickness: 10,
                            width: 5,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: _checkBookMark,
                                icon: (_bookMarkCheck
                                    ? const Icon(Icons.bookmark)
                                    : const Icon(Icons.bookmark_border)),
                              ),
                              const Text('북마크'),
                            ],
                          ),
                          const SizedBox(width: 15.0),
                          const VerticalDivider(
                            //TODO: VerticalDivider 가 화면에 보이지 않음 (KS)
                            thickness: 10,
                            width: 5,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share),
                              ),
                              const Text('공유'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementLikeCounter() {
    setState(() {
      if (!_likeCntCheck) {
        _likeCntCheck = !_likeCntCheck;
        _likeCnt++;
      } else {
        _likeCntCheck = !_likeCntCheck;
        _likeCnt--;
      }
    });
  }

  void _checkBookMark() {
    setState(() {
      if (!_bookMarkCheck) {
        _bookMarkCheck = !_bookMarkCheck;
      } else {
        _bookMarkCheck = !_bookMarkCheck;
      }
    });
  }
}
