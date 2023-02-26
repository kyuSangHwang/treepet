import 'package:flutter/material.dart';
import 'package:treepet/component/more_screen.dart';
import 'package:treepet/component/wedding_component.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/family/wedding/wedding_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';

class WeddingProposeDetailScreen extends StatefulWidget {
  const WeddingProposeDetailScreen({Key? key}) : super(key: key);

  @override
  State<WeddingProposeDetailScreen> createState() =>
      _WeddingProposeDetailScreenState();
}

class _WeddingProposeDetailScreenState
    extends State<WeddingProposeDetailScreen> {
  final List<String> _images = [
    'asset/image/dog1.jpeg',
    'asset/image/dog2.jpeg',
    'asset/image/dog3.jpeg',
  ];
  final PageController _pageController = PageController(initialPage: 0);
  double _currentPage = 0;
  final String _selectedRadio = "autoMessage";
  final String introduceContent =
      "이번이 첫 교배 이구요. 발랄 활달하고 개구장이 같은 성격입니다. 아직 꽃 도장 전이고 미리 구하는 거에용~ 신랑 쪽이 교배 경험 있었으면 좋겠습니다(없어도 상관없음) 저희 아이가 작아서 신랑이 너무 크면 아이가 힘들 것 같아서 신랑 크기가 2키로는 안 넘었으면 좋겠어요~작으면 작을수록 좋을 것 같아요 저희 아이 몸무게는1.8정도 됩니다 짖음도 1도 없고 입질도 없어요 진짜 완전 순둥이 입니다🥰 사진은 애기 때 사진이라 눈물자국이 좀 있는데  지금은 없어용~!ㅎㅎ";


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeddingPostCreateAppBar(context, '프로포즈 받은/보낸 게시물'),
      body: _WeddingProposeDetailScreenBody(context),
      bottomNavigationBar:
          WeddingBottomAppBarButton(context, "확 인", const WeddingScreen()),
    );
  }

  SizedBox _WeddingProposeDetailScreenBody(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _MemberInfoAndSeeMoreButton(context),
            _ProposePetImages(),
            _ProposeMessage(),
            _IntroductionBrideGroom(),
            _InformationBrideGroom(),



            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("프로포즈 메시지"),
                Text("프로포즈 메시지 내용"),
              ],
            ),




            const Text("신랑 소개 영역, 신랑&신부 조회 내용 이어서 보여주기")
          ],
        ),
      ),
    );
  }

  /// 회원 정보 및 더 보기 버튼
  Padding _MemberInfoAndSeeMoreButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _MemberInfo(context),
          _SeeMoreButton(context),
        ],
      ),
    );
  }

  /// 회원 정보
  Row _MemberInfo(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const WeddingScreen()));
          },
          iconSize: 40,
          icon: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('asset/image/jaeHoon.png'),
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
    );
  }

  /// 더보기 버튼
  IconButton _SeeMoreButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            context: context,
            builder: (_) => const MoreScreen());
      },
      icon: const Icon(Icons.more_horiz),
    );
  }

  /// 반려동물 이미지 영역
  Padding _ProposePetImages() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_images[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DotsIndicator(
                dotsCount: _images.length,
                position: _currentPage,
                decorator: const DotsDecorator(
                  activeColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 프로포즈 메시지 자동 또는 작성하는 Form 보여주는 영역
  SizedBox _ProposeMessage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categoryTitle("프로포즈 메시지", 130.0),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          const SizedBox(height: 5.0),
          if (_selectedRadio == 'autoMessage')
            Text.rich(
              _AutoMessageContent(),
            )
          else if (_selectedRadio == 'writeMessage')
            _WriteMessageContent(),
          const SizedBox(height: 5.0),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }

  /// 프로포즈 메시지 자동으로 보여주는 내용
  /// TODO: 보내는 고객의 회원 정보를 mapping 해줘야 한다.
  TextSpan _AutoMessageContent() {
    return const TextSpan(
      text: '안녕하세요 저는 ',
      style: wedding_post_detail_145_400_02,
      children: <TextSpan>[
        TextSpan(
          text: '예삐',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: ' 보호자 ',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: '규상어',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: '입니다.\n',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: '예삐',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: '는 ',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: '2.85kg',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: '의 ',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: ' 회색털',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: '을 ',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: '가진 ',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: '푸들 ',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: '이에요.\n',
          style: wedding_post_detail_145_400_02,
        ),
        // \n야무진개발자 보호자님의 몽실이와 웨딩을 하고 싶어요!', style: wedding_post_detail_145_400_02)
        TextSpan(
          text: '야무진개발자',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: ' 보호자님의 ',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: '몽실이',
          style: wedding_post_detail_145_400_02_d,
        ),
        TextSpan(
          text: '와',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: ' 웨딩을 하고 싶어요!\n',
          style: wedding_post_detail_145_400_02,
        ),
        TextSpan(
          text: '잘 부탁드립니다.',
          style: wedding_post_detail_145_400_02,
        ),

      ],
    );
  }

  /// 프로포즈 메시지를 직접 입력하는 영역
  TextFormField _WriteMessageContent() {
    return TextFormField(
      minLines: 10,
      maxLines: 10,
      decoration: const InputDecoration(
        hintText: '로미를 소개해주세요!',
        border: InputBorder.none,
      ),
      cursorColor: Colors.green,
      style: wedding_post_detail_135_300_014,
    );
  }

  /// 웨딩 게시물 조회 화면, 신랑 소개 영역
  Container _IntroductionBrideGroom() {
    return Container(
      color: Colors.white,
      // height: 100.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _WeddingPostDetailScreenCategoryTitle(true, "소개"),
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
    );
  }

  Container _InformationBrideGroom() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _WeddingPostDetailScreenCategoryTitle(false, "정보"),
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
                children: const [
                  SizedBox(
                    width: 80,
                    child: Text(
                      '혈통서 유무',
                      style: wedding_post_detail_14_400_012,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '상관없음',
                    style: wedding_post_detail_13_300_012,
                  ),
                  // _buildPanel(),
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
    );
  }

  /// 웨딩 게시물 조회 화면, 카테고리 이름 넣어주기
  ///
  /// [brideGroomCheck] int,
  /// [categoryTitle] String,
  Text _WeddingPostDetailScreenCategoryTitle(bool brideGroomCheck, String categoryTitle) {
    return Text(
      brideGroomCheck == true ? "신랑$categoryTitle" : "신부$categoryTitle",
      style: wedding_post_detail_18_500_012,
    );
  }

}
