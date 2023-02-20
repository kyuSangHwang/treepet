import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/address_search_screen.dart';

class ProfileRegisterScreen extends StatefulWidget {
  const ProfileRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ProfileRegisterScreen> createState() => _ProfileRegisterScreenState();
}

class _ProfileRegisterScreenState extends State<ProfileRegisterScreen> {
  int selectedSexButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileRegisterScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 60,
                      ),
                      SizedBox(height: 20),
                      ProfileUserName(context),
                      SizedBox(height: 40),
                      ProfileUserBirth(context),
                      SizedBox(height: 40),
                      ProfileUserSex(context),
                      SizedBox(height: 40),
                      ProfileUserNick(context),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              RenderProfileRegisterButton(context)
            ],
          ),
        ),
      ),
    );
  }

  AppBar ProfileRegisterScreenAppBar(BuildContext context) {
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
        '프로필 등록',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget ProfileUserName(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이름', style: register_profile_title),
          TextFormField(
            style: register_profile_content,
            decoration: InputDecoration(
                hintText: '이름을 입력해주세요',
                hintStyle: register_profile_placeholder),
          ),
        ],
      ),
    );
  }

  Widget ProfileUserBirth(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('생년월일', style: register_profile_title),
          TextFormField(
            style: register_profile_content,
            decoration: InputDecoration(
                hintText: 'YYYYMMDD', hintStyle: register_profile_placeholder),
          )
        ],
      ),
    );
  }

  Widget ProfileUserSex(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('생년월일', style: register_profile_title),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSexButtonIndex = 1;
                      });
                    },
                    child: Text('남성'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                      selectedSexButtonIndex == 1
                          ? Colors.white
                          : Colors.grey[700],
                      backgroundColor:
                      selectedSexButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[300],
                    ),

                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSexButtonIndex = 2;
                      });
                    },
                    child: Text('여성'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                      selectedSexButtonIndex == 2
                          ? Colors.white
                          : Colors.grey[700],
                      backgroundColor:
                      selectedSexButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ProfileUserNick(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('활동명', style: register_profile_title),
          TextFormField(
            style: register_profile_content,
            decoration: InputDecoration(
                hintText: '2글자 이상 8글자 이하로 입력해주세요', hintStyle: register_profile_placeholder),
          )
        ],
      ),
    );
  }

  Widget RenderProfileRegisterButton(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AddressSearchScreen()));
          },
          child: Text(
            '다음',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}
