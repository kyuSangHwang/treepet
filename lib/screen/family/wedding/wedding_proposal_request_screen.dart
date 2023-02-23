import 'package:flutter/material.dart';
import 'package:treepet/component/wedding_component.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/family/wedding/wedding_screen.dart';

class WeddingProposalReQuestScreen extends StatefulWidget {
  const WeddingProposalReQuestScreen({Key? key}) : super(key: key);

  @override
  State<WeddingProposalReQuestScreen> createState() => _WeddingProposalReQuestScreenState();
}

class _WeddingProposalReQuestScreenState extends State<WeddingProposalReQuestScreen> {
  String? _selectedRadio = 'autoMessage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeddingPostCreateAppBar11(context),
      body: _WeddingProposalReQuestScreenBody(),
      bottomNavigationBar: WeddingBottomAppBarButton(context, "프로포즈 신청하기", const WeddingScreen()),
    );
  }

  /// 프로포즈 신청 화면
  SizedBox _WeddingProposalReQuestScreenBody() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _SelectProposalMethod(),
          _ProposeMessage(),
          _CautionGuidanceProposal(),
        ],
      ),
    );
  }

  /// 프로포즈 방식 선택 영역
  SizedBox _SelectProposalMethod() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          categoryTitle("프로포즈 방식 선택", 130.0),
          _SelectProposalMethodRadioListTileButtons(),
        ],
      ),
    );
  }

  /// 프로포즈 방식 선택 영역, 라디오 버튼
  Row _SelectProposalMethodRadioListTileButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _RadioListTileButton('자동 메시지', 'autoMessage'),
        _RadioListTileButton('직접 작성하기', 'writeMessage'),
      ],
    );
  }

  /// RadioListTile에 들어가는 버튼
  ///
  /// [radioName] String, 버튼의 이름
  /// [radioValue] String, 버튼의 value 값
  SizedBox _RadioListTileButton(String radioName, String radioValue) {
    return SizedBox(
      width: 150,
      child: RadioListTile(
        title: Text(radioName,  style: wedding_post_detail_14_400_012),
        value: radioValue,
        groupValue: _selectedRadio,
        onChanged: (value) {
          setState(() {
            if (_selectedRadio == value) return;
            _selectedRadio = value;
          });
        },
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  /// 프로포즈 메시지 자동 또는 작성하는 Form 보여주는 영역
  SizedBox _ProposeMessage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
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

  /// 프로포즈 주의 및 안내사항 영역
  SizedBox _CautionGuidanceProposal() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categoryTitle("프로포즈 주의 및 안내사항", 160.0),
          const SizedBox(height: 5),
          Column(
            children: [
              cautionGuidanceProposalContents("프로포즈는 반려동물 당 1회 가능합니다."),
              const SizedBox(height: 6),
              cautionGuidanceProposalContents("프로포즈를 하는 동아 대표 반려동물을 변경할 수 없습니다. (취소 시 변경이 가능합니다.)"),
              const SizedBox(height: 6),
              cautionGuidanceProposalContents("상대방이 수락 시 채팅이 활성화 되며 알람이 옵니다."),
              const SizedBox(height: 6),
              cautionGuidanceProposalContents("직접작성 시 금전 요구 및 과도한 요구가 포함된 프로포즈는 삭제될 수 있습니다."),
            ],
          ),
        ],
      ),
    );
  }

  /// 프로포즈 주의 및 안내사항 내용을 정해진 양식에 맞게 보여준다.
  ///
  /// [cautionGuidanceContent] String, 주의 및 안내사항 내용.
  Row cautionGuidanceProposalContents(String cautionGuidanceContent) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Icon(Icons.brightness_1_rounded, size: 5),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            cautionGuidanceContent,
            softWrap: true,
            style: const TextStyle(
              fontFamily: 'pretendard',
              fontSize: 13.5,
              fontWeight: FontWeight.w300,
              height: 1.4,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  /// 프로포즈 메시지에 들어가는 반려동물 이미지 (보류)
  Center proposePetImage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [ BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset("asset/image/treepetMale.jpeg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  AppBar WeddingPostCreateAppBar11(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: const Text(
        '프로포즈 신청',
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }



}
