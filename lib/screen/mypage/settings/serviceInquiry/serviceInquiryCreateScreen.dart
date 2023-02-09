import 'package:flutter/material.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class ServiceInquiryCreateScreen extends StatefulWidget {
  ServiceInquiryCreateScreen({Key? key}) : super(key: key);

  @override
  State<ServiceInquiryCreateScreen> createState() =>
      _ServiceInquiryCreateScreenState();
}

class _ServiceInquiryCreateScreenState
    extends State<ServiceInquiryCreateScreen> {
  late String option = '1';

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: ServiceInquiryCreateScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RenderServiceInquiryCategoryCheck(),
                    const Divider(height: 20),
                    RenderServiceInquiryContent(),
                    const Divider(height: 20),
                  ],
                ),
              ),
            ),
            RenderServiceInquiryButton(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  AppBar ServiceInquiryCreateScreenAppBar(BuildContext context) {
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
        '문의하기',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderServiceInquiryCategoryCheck() {
    return Column(
      children: [
        Row(
          children: [
            ServiceInquiryCategory(
              title: '오류•불편 신고',
              value: '1',
            ),
            ServiceInquiryCategory(
              title: '컨텐츠 추가 요청',
              value: '2',
            ),
          ],
        ),
        Row(
          children: [
            ServiceInquiryCategory(
              title: '정보 수정 요청',
              value: '3',
            ),
            ServiceInquiryCategory(
              title: '제휴 문의',
              value: '4',
            ),
          ],
        ),
        Row(
          children: [
            ServiceInquiryCategory(
              title: '이벤트',
              value: '5',
            ),
            ServiceInquiryCategory(
              title: '기타',
              value: '6',
            ),
          ],
        ),
      ],
    );
  }

  ServiceInquiryCategory({required String title, required value}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: RadioListTile(
        title: Text(
          title,
          style: inquiry_create_category,
        ),
        value: value,
        groupValue: option,
        onChanged: (value) {
          setState(() {
            option = value!;
          });
        },
      ),
    );
  }

  Widget RenderServiceInquiryContent() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20)
      ),
      width: MediaQuery.of(context).size.width * 0.92,
      height: 300,
      // color: BLACK_COLOR,
      child: CustomTextField(
          isTitle: false,
          placeHolder:
              '문의 내용을 입력해주세요.\n최대한 빨리 답변 드리겠습니다.\n\n글자 수 제한(500자 내)'),
    );
  }

  Widget RenderServiceInquiryButton() {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.92,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MAIN_COLOR,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('완료', style: big_long_button_text),
        ),
      ),
    );
  }
}
