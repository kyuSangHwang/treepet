import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

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
  // 입력한 메시지를 저장하는 리스트
  final List<ChatMessage> _message = <ChatMessage>[];

  // 텍스트필드 제어용 컨트롤러
  final TextEditingController _textController = TextEditingController();

  // 텍스트필드에 입력된 데이터의 존재 여부
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommunityPostDetailAppBar(context),
      body: SafeArea(
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
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
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
            child: Image.asset(
              'asset/image/dog1.jpeg',
              fit: BoxFit.cover,
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
              IconButton(onPressed: () {}, icon: Icon(Icons.pets)),
              Text(
                '좋아요 3개',
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
              //입려된 텍스트에 변화가 있을 때 마다
              onChanged: (text) {
                setState(() {
                  _isComposing = text.length > 0;
                });
              },
              // 키보드상에서 확인을 누를 경우. 입력값이 있을 때에만 _handleSubmitted 호출
              onSubmitted: _isComposing ? _handleSubmitted : null,
              // 텍스트 필드에 힌트 텍스트 추가
              decoration: InputDecoration(hintText: 'Send a message'),
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
    );

    // 리스트에 메시지 추가
    setState(() {
      _message.insert(0, message);
    });

    // 위젯의 애니메이션 효과 발생
    message.animationController.forward();
  }
}

// 리스트뷰에 추가될 메시지 위젯
class ChatMessage extends StatelessWidget {
  final String text; // 출력할 메시지
  final AnimationController animationController; // 리스트뷰에 등록될때 보여질 효과

  const ChatMessage(
      {required this.text, required this.animationController, Key? key})
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
                        onTap: (){
                          // renderCommentArea()
                          print('네네네네');
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
