import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/mypage/settings/settings_alram_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_announcement_list_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_block_list_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_event_list_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_faq_list_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_log_out_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_privacy_policy_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_service_inquiry_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_term_of_user_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_withdrawal_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class SettingsScreen extends StatelessWidget {
  final screens = [
    ScreenModel(builder: (_) => SettingsAlarmScreen(), name: '알람 설정'),
    ScreenModel(builder: (_) => SettingsTermOfUserScreen(), name: '이용약관'),
    ScreenModel(
        builder: (_) => SettingsPrivacyPolicyScreen(), name: '개인정보 처리방침'),
    ScreenModel(builder: (_) => SettingsFaqListScreen(), name: 'FAQ'),
    ScreenModel(builder: (_) => SettingsServiceInquiryScreen(), name: '서비스 문의'),
    ScreenModel(builder: (_) => SettingsBlockListScreen(), name: '차단 목록'),
    ScreenModel(builder: (_) => SettingsAnnouncementListScreen(), name: '공지사항'),
    ScreenModel(builder: (_) => SettingsEventListScreen(), name: '이벤트'),
    ScreenModel(builder: (_) => SettingsLogOutScreen(), name: '로그아웃'),
    ScreenModel(builder: (_) => SettingsWithdrawalScreen(), name: '회원탈퇴'),
  ];

  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingScreenAppBar(context),
      body: ListView(
        children: [
          Column(
            children: [
              renderSettingsList(context),
            ],
          ),
        ],
      ),
    );
  }

  AppBar SettingScreenAppBar(BuildContext context) {
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
        '설정',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  // TODO : 컨테이너의 왼쪽 여백 (패딩 안주고싶음)
  Widget renderSettingsList(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        children: screens
            .map(
              (screen) => TextButton(
                onPressed: () {
                  print(screen.name);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: screen.builder));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        screen.name,
                        style: settings_list_textStyle,
                      ),
                    ),
                    SizedBox(height: 70,
                    child: Icon(Icons.chevron_right),)
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

/*
children: screens
            .map(
              (screen) => TextButton(
                onPressed: () {
                  print(screen.name);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: screen.builder));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      // width: MediaQuery.of(context).size.width * 0.92,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            screen.name,
                            style: settings_list_textStyle,
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
*/
