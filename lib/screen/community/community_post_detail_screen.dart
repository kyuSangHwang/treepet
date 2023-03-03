import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:treepet/component/more_screen.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';

const String _name = "망치엄마";
final List<ChatMessage> _message = <ChatMessage>[];

class CommunityPostDetailScreen extends StatefulWidget {
  const CommunityPostDetailScreen({Key? key}) : super(key: key);

  @override
  State<CommunityPostDetailScreen> createState() =>
      _CommunityPostDetailScreenState();
}

class _CommunityPostDetailScreenState extends State<CommunityPostDetailScreen>
    with TickerProviderStateMixin {
  double _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  // 이미지를 저장하는 리스트
  final List imageList = [
    'asset/image/dog1.jpeg',
    'asset/image/dog2.jpeg',
    'asset/image/dog3.jpeg',
    'asset/image/dog4.png'
  ];

  int _likeCnt = 0;
  bool _likeCntCheck = false;

  // 입력한 메시지를 저장하는 리스트
  final List<ChatMessage> _message = <ChatMessage>[];

  // 텍스트필드에 입력된 데이터의 존재 여부
  bool _isComposing = false;

  // ScrollController 초기화
  FocusNode _focusNode = FocusNode();

  // 텍스트필드 제어용 컨트롤러
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page ?? 0;
      });
    });

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunityPostDetailAppBar(context),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      renderTitle(context),
                      renderUserInfo(context),
                      renderImage(context),
                      renderIcon(context),
                      renderContent(context),
                      suit_sized_box_style(),
                      renderCommentArea(context),
                    ],
                  ),
                ),
              ),
              renderComment(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar CommunityPostDetailAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      title: Text(
        '게시글 상세',
        style: TextStyle(color: BLACK_COLOR),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, color: BLACK_COLOR),
      ),
    );
  }

  Padding renderTitle(BuildContext context) {
    return Padding(
      padding: post_item_left_padding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('자유', style: co_post_detail_category),
          SizedBox(
            width: 10,
          ),
          Text('뭉치 오늘 신났네~~', style: co_post_detail_title),
        ],
      ),
    );
  }

  Container renderUserInfo(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('asset/image/dog3.jpeg'),
                ),
                SizedBox(width: 10),
                Text('뭉치아빠', style: co_post_detail_user_nick),
              ],
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    context: context,
                    builder: (_) => MoreScreen());
              },
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
      ),
    );
  }

  Container renderImage(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: WHITE_COLOR,
            child: Stack(
              children: [
                PageView(
                  children: imageList
                      .map((image) => Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ))
                      .toList(),
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = double.parse(value.toString());
                    });
                  },
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: Text(
                      '${(_currentIndex + 1).toInt()} / ${imageList.length}',
                      style: co_post_detail_image_paging,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DotsIndicator(
                      dotsCount: imageList.length,
                      position: _currentIndex,
                      decorator: const DotsDecorator(
                        activeColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container renderIcon(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: _incrementLikeCounter,
                icon: (_likeCntCheck
                    ? const Icon(Icons.favorite, color: Colors.redAccent)
                    : const Icon(Icons.favorite_border)),
              ),
              Text(
                '좋아요 ' '${_likeCnt.toString()}' '개',
                style: co_post_detail_sub_text,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.near_me)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
            ],
          ),
        ],
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

  Padding renderContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        child: Text(
          '주말에 날씨가 좋아서 코에 바람좀 넣으라고 애견운동장 놀러왔어요~!! 친구들이랑 재밌게 노는것같아 기분 좋은 하루네요! ㅎㅎㅎㅎㅎ',
          style: co_post_detail_contetnt,
        ),
      ),
    );
  }

  Widget renderCommentArea(BuildContext context) {
    return ListView.builder(
      // 리스트뷰의 스크롤 방향을 반대로 변경. 최신 메시지가 하단에 추가됨
      primary: false,
      reverse: true,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _message.length,
      itemBuilder: (context, index) => _message[index],
    );
  }

  // 사용자로부터 메시지를 입력받는 위젯 선언
  Container renderComment(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              scrollController: _scrollController,
              focusNode: _focusNode,
              //입려된 텍스트에 변화가 있을 때 마다
              onChanged: (value) {
                setState(() {
                  _isComposing = value.length > 0;
                });
                // 댓글이 변경될 때마다 텍스트필드의 값을 갱신합니다.
                _textController.value =
                    _textController.value.copyWith(text: value);
                // 댓글이 추가되면 텍스트필드에 포커스를 맞춥니다.
                _textController.selection = TextSelection.fromPosition(
                    TextPosition(offset: value.length));
              },
              // 키보드상에서 확인을 누를 경우. 입력값이 있을 때에만 _handleSubmitted 호출
              onSubmitted: _isComposing ? _handleSubmitted : null,
              // 텍스트 필드에 힌트 텍스트 추가
              decoration: InputDecoration(hintText: '메시지를 입력하세요.'),
            ),
          ),
          // 전송 버튼
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              onPressed: _isComposing
                  ? () => _handleSubmitted(_textController.text)
                  : null,
              icon: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }

  // 메시지 전송 버튼이 클릭될 때 호출
  void _handleSubmitted(String text) {
    // 텍스트 필드의 내용 삭제
    _textController.clear();

    // _isComposing을 다시 false로 설정
    setState(() {
      _isComposing = false;
    });

    // 추가된 댓글 위젯에 포커스를 줍니다.
    FocusNode focusNode = FocusNode();
    FocusScope.of(context).requestFocus(focusNode);

    // 입력받은 텍스트를 이용해서 리스트에 추가할 메시지 생성
    ChatMessage message = ChatMessage(
      text: text,
      // animationController 항목에 애니메이션 효과 설정
      // ChatMessage은 UI를 가지는 위젯으로 새로운 message가 리스트뷰에 추가될 때
      // 발생할 애니메이션 효과를 위젯에 직접 부여함
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
      focusNode: focusNode,
    );

    // 리스트에 메시지 추가
    setState(() {
      _message.insert(0, message);
    });

    // 위젯의 애니메이션 효과 발생
    message.animationController.forward();

    _scrollController.jumpTo(1000);

  }
}

// 리스트뷰에 추가될 메시지 위젯
class ChatMessage extends StatelessWidget {
  final String text; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될때 보여질 효과
  final FocusNode focusNode;

  const ChatMessage(
      {required this.text,
      required this.animationController,
      required this.focusNode,
      Key? key})
      : super(key: key);

  //TODO : 여기여기여기
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CircleAvatar(),
            ),
            SizedBox(width: 10),
            Expanded(
              // 컬럼 추가
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 사용자명을 출력
                  SizedBox(height: 2),
                  Text(_name, style: co_post_detail_user_nick),
                  SizedBox(height: 2),
                  // 입력받은 메시지 출력
                  Container(
                    child: Text(text),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('좋아요'),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // renderCommentArea()
                          // focusNode.requestFocus();
                        },
                        child: Text('답글 달기'),
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
}
