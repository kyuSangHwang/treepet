import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class CurrentTime {
  late String commentWriteTime;
  late String postWriteTime;

  CurrentTime() {
    DateTime now = DateTime.now();
    commentWriteTime = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    postWriteTime = '${now.year}년 ${now.month.toString().padLeft(2, '0')}월 ${now.day.toString().padLeft(2, '0')}일';
  }
}

class ServiceInquiryDetailScreen extends StatefulWidget {
  const ServiceInquiryDetailScreen({Key? key}) : super(key: key);

  @override
  State<ServiceInquiryDetailScreen> createState() =>
      _ServiceInquiryDetailScreenState();
}

class _ServiceInquiryDetailScreenState
    extends State<ServiceInquiryDetailScreen> {
  final String content =
      '안녕하세요 저는 트리펫을 이용하고있 고객입니다! 추가적으로 제공해주셨으면하는 컨텐츠가 있어서요! 관련된 컨텐츠를 추가해주셨으면 감사하겠습니다! 감사합니다~';
  bool? isExist = true;
  DateTime time = DateTime.now();

  String category = '컨텐츠 추가 요청';
  String comment = '감사합니다 00님. 새로운 컨텐츠 업데이트를 진행중에 있습니다. 조금만 기다려주시면 감사하겠습니다.';
  String nonComment = '트리펫에서 문의 내용 확인중에 있습니다.\n조금만 기다려주세요!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingServiceInquiryDetailScreenAppBar(context),
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              child: Row(
                children: [
                  Text(category, style: inquiry_detail_category),
                  SizedBox(width: 30),
                  Text(CurrentTime().postWriteTime, style: inquiry_detail_post_wrtie_time),
                ],
              ),
            ),
            Divider(height: 40),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              child: Text(content, style: inquiry_detail_cotent),
            ),
            Divider(height: 40),

            //
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('트리펫', style: inquiry_detail_comment_author),
                  SizedBox(height: 5),
                  isExist == true
                      ? Text(comment, style: inquiry_detail_comment_content)
                      : Text(nonComment, style: inquiry_detail_comment_content),
                  SizedBox(height: 5),
                  isExist == true ? Text(CurrentTime().commentWriteTime, style: inquiry_detail_comment_wrtie_time) : Text('')

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar SettingServiceInquiryDetailScreenAppBar(BuildContext context) {
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
        '서비스 문의 내용',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }
}
