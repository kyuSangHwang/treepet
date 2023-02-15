import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class PersonalInformationMarketingPurposesModel {
  final String title;
  final String content;

  PersonalInformationMarketingPurposesModel({
    required this.title,
    required this.content,
  });
}

class PersonalInformationMarketingPurposesDetailScreen extends StatelessWidget {
  final TermConditionsAgreeItem = [
    PersonalInformationMarketingPurposesModel(
      title: '1조',
      content:
      '본 약관은 주식회사 에스에이치에스테크(이하 "회사")가 운영하는 트리펫 "서비스"와 관련하여, "회사"와 이용 "회원"간의 서비스 이용조건 및 절차, "회사"와 "회원"간의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다. 본약관은 PC통신, 스마트폰(안드로이드폰, 아이폰 등)앱 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다.',
    ),
    PersonalInformationMarketingPurposesModel(
      title: '2조',
      content:
      '본 12약관은 주식회사 에스에이치에스테크(이하 "회사")가 운영하는 트리펫 "서비스"와 관련하여, "회사"와 이용 "회원"간의 서비스 이용조건 및 절차, "회사"와 "회원"간의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다. 본약관은 PC통신, 스마트폰(안드로이드폰, 아이폰 등)앱 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다.',
    ),
    PersonalInformationMarketingPurposesModel(
      title: '3조',
      content:
      '본 약관은 주식회사 에스에이치에스테크(이하 "회사")가 운영하는 트리펫 "서비스"와 관련하여, "회사"와 이용 "회원"간의 서비스 이용조건 및 절차, "회사"와 "회원"간의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다. 본약관은 PC통신, 스마트폰(안드로이드폰, 아이폰 등)앱 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다.',
    ),
    PersonalInformationMarketingPurposesModel(
      title: '4조',
      content:
      '본 약관은 주식회사 에스에이치에스테크(이하 "회사")가 운영하는 트리펫 "서비스"와 관련하여, "회사"와 이용 "회원"간의 서비스 이용조건 및 절차, "회사"와 "회원"간의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다. 본약관은 PC통신, 스마트폰(안드로이드폰, 아이폰 등)앱 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다.',
    ),
  ];

  PersonalInformationMarketingPurposesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingTermOfUserScreenAppBar(context),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: TermConditionsAgreeItem.map(
                        (item) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(item.title, style: access_agreement_title),
                        SizedBox(height: 10),
                        Text(item.content,  style: access_agreement_content),
                      ],
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar SettingTermOfUserScreenAppBar(BuildContext context) {
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
        '마케팅 목적 개인정보 수집 및 이용동의',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }
}