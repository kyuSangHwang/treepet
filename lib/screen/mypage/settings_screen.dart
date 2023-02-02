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
      body: Column(
        children: screens
            .map(
              (screen) => Padding(
                padding: settings_item_left_padding(),
                child: TextButton(
                  onPressed: () {
                    print(screen.name);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: screen.builder));
                  },
                  child: Row(
                    children: [
                      SizedBox(height: 50,),
                      Text(
                        screen.name,
                        style: settings_list_textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // 알림 설정
  // 이용약관
  // 개인정보 처리방침
  // FAQ
  // 서비스 문의
  // 차단 목록
  // 공지사항
  // 이벤트
  // 로그아웃
  // 회원탈퇴

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
}
