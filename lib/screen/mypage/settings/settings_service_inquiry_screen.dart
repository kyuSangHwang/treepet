import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/mypage/settings/serviceInquiry/service_inquiry_create_screen.dart';
import 'package:treepet/screen/mypage/settings/serviceInquiry/service_inquiry_detail_screen.dart';

class serviceInquiryModel {
  final String title;
  final String subTitle;
  final String content;
  final int time;

  serviceInquiryModel({
    required this.title,
    required this.subTitle,
    required this.content,
    required this.time,
  });
}

class SettingsServiceInquiryScreen extends StatelessWidget {
  final ServiceInquiry = [
    serviceInquiryModel(
      title: '문의 드립니다',
      subTitle: '질문',
      content: '안녕하세요. 트리펫을 이용하고있는 ...',
      time: 20230207,
    ),
    serviceInquiryModel(
      title: '문의 드립니다',
      subTitle: '질문',
      content: '안녕하세요. 트리펫을 이용하고있는 ...',
      time: 20230207,
    ),
  ];

  SettingsServiceInquiryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingServiceInquiryScreenAppBar(context),
      body: RenderServiceInquiry(context),
    );
  }

  AppBar SettingServiceInquiryScreenAppBar(BuildContext context) {
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
        '서비스 문의',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderServiceInquiry(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return RenderServiceInquiryList(context);
            },
          ),
        ),
        RenderServiceInquiryBottomButton(context),
      ],
    );
  }

  Widget RenderServiceInquiryList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: ServiceInquiry.map(
          (inquiry) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ServiceInquiryDetailScreen()));
            },
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              inquiry.subTitle,
                              style: inquiry_sub_title,
                            ),
                            SizedBox(width: 10),
                            Text(
                              inquiry.time.toString(),
                              style: inquiry_sub_title,
                            ),
                          ],
                        ),
                        Text(
                          inquiry.title,
                          style: inquiry_title,
                        ),
                      ],
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                        color: MAIN_COLOR,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "문의접수",
                          style: inquiry_state,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(height: 0),
              ],
            ),
          ),
        ).toList(),
      ),
    );
  }

  Widget RenderServiceInquiryBottomButton(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('트리펫 이용 중 궁금하신 사항 또는\n문의사항이 있으시면 언제든 문의해주세요!',textAlign: TextAlign.center,),
            SizedBox(height: 10),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ServiceInquiryCreateScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "서비스 문의하기",
                      style: inquiry_bottom_button,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
