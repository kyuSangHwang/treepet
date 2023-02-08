import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class faqPostModel {
  final String title;
  final String content;
  bool isExpanded;

  faqPostModel({
    required this.title,
    required this.content,
    required this.isExpanded,
  });
}

class SettingsFaqListScreen extends StatelessWidget {
  const SettingsFaqListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingFaqListScreenAppBar(context),
      body: SingleChildScrollView(
        child: renderFaqPost(),
      ),
    );
  }

  AppBar SettingFaqListScreenAppBar(BuildContext context) {
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
        '자주 묻는 질문',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }
}

class renderFaqPost extends StatefulWidget {
  const renderFaqPost({super.key});

  @override
  State<renderFaqPost> createState() => _renderFaqPostState();
}

class _renderFaqPostState extends State<renderFaqPost> {
  final faqPost = [
    faqPostModel(
      title: '웨딩인 뭔가요?',
      content:
      '반려동물의 가정교배를 원하는 보호자들간의 연결을 도와주는 서비스로 강아지공장, 펫샵과 같은 판매를 위한 무분별한 출산을 해결하고싶어하는 서비스 플랫폼입니다.',
      isExpanded: false,
    ),
    faqPostModel(
      title: '펫밀리가 뭔가요?',
      content:
      '반려동물간의 결혼 / 분양 / 입양을 통해 보호자들과 반려동물들 사이에서 형성된 의미의 가족입니다.',
      isExpanded: false,
    ),
    faqPostModel(
      title: '트리펫은 어떤 서비스를 하나요?',
      content:
      '반려동물의 가정교배를 원하는 보호자들간의 연결을 도와주는 서비스로 강아지공장, 펫샵과 같은 판매를 위한 무분별한 출산을 해결하고싶어하는 서비스 플랫폼입니다.',
      isExpanded: false,
    ),
    faqPostModel(
      title: '분양업자들은 어떻게 방지하나요?',
      content:
      '저희 서비스가 추구하는 일반 보호자들간의 웨딩으로 인한 "무료"분양과 분양업자들의 목적인 "유료"분양과는 방향성이 다르기에 방지할 수 있다고 생각합니다.',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          faqPost[index].isExpanded = !isExpanded;
        });
      },
      children: faqPost.map<ExpansionPanel>((faqPostModel item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.title, style: faq_title,),
            );
          },
          body: ListTile(
              title: Text(item.content, style: faq_concent,),
              ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}