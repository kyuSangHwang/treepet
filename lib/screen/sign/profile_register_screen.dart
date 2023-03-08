import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/component/image_pick.dart';
import 'package:treepet/component/warning_text.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/address_search_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRegisterScreen extends StatefulWidget {
  const ProfileRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ProfileRegisterScreen> createState() => _ProfileRegisterScreenState();
}

class _ProfileRegisterScreenState extends State<ProfileRegisterScreen> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();

  late File _imageFile = File(" ");
  List<dynamic> imageFilesList = [];
  List<Widget> imagesWidgetList = [];
  int selectedSexButtonIndex = 0;

  String _profileUserNameController = '';
  String _profileUserBirthController = '';
  String _profileUserSexController = '';
  String _profileUserNickController = '';

  bool _showError = false;

  @override
  void initState() {
    super.initState();
    imageFilesList.add(addButton());
    imagesWidgetList = imageFilesList.map((item) => item as Widget).toList();
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        ImagePickerButton(),
                        SizedBox(height: 20),
                        ProfileUserName(context),
                        SizedBox(height: 40),
                        ProfileUserBirth(context),
                        SizedBox(height: 40),
                        ProfileUserSex(context),
                        SizedBox(height: 40),
                        ProfileUserNick(context),
                        SizedBox(height: 40),
                        ProfileUserSelfIntroduction(context),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                RenderProfileRegisterButton(context),
              ],
            ),
          ),
        ),
      ),
        // bottomNavigationBar: RenderProfileRegisterButton(context),
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

  Container addButton() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        onPressed: () {
          _getImage();
        },
        icon: Icon(
          Icons.add,
          size: 40,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  /// 이미지 선택 했을 때 [imagesWidgetList]에 넣어서 화면에 뿌려주기
  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageFilesList.clear();
      imagesWidgetList.clear();
      _imageFile = File(pickedFile!.path);
      imageFilesList.add(_imageFile);
      imagesWidgetList.add(addImages(imageFilesList.length - 1));
    });
  }

  Container addImages(index) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(imageFilesList[index]),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(100),
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(8),
            ],
            decoration: InputDecoration(
              hintText: '이름을 입력해주세요',
              hintStyle: register_profile_placeholder,
            ),
            onChanged: (value) {
              setState(() {
                _profileUserNameController = value;
              });
            },
            autovalidateMode: autoValidateMode,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return '올바른 형식으로 입력해주세요';
              }
            },
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
            keyboardType: TextInputType.number,
            style: register_profile_content,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8),
            ],
            decoration: InputDecoration(
              hintText: 'YYYYMMDD',
              hintStyle: register_profile_placeholder,
            ),
            onChanged: (value) {
              setState(() {
                _profileUserBirthController = value;
              });
            },
            autovalidateMode: autoValidateMode,
            validator: (value) {
              if (value?.length != 8) {
                return '올바른 형식으로 입력해주세요';
              }
            },
          ),
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
          Text('성별', style: register_profile_title),
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
                        _profileUserSexController = '남성';
                        _showError = false;
                      });
                    },
                    child: Text('남성'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedSexButtonIndex == 1
                          ? Colors.white
                          : Colors.grey[700],
                      backgroundColor: selectedSexButtonIndex == 1
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
                        _profileUserSexController = '여성';
                        _showError = false;
                      });
                    },
                    child: Text('여성'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedSexButtonIndex == 2
                          ? Colors.white
                          : Colors.grey[700],
                      backgroundColor: selectedSexButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ],
          ),
          _showError == true ? RenderWrongInput() : const SizedBox(),
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(8),
            ],
            decoration: InputDecoration(
              hintText: '2글자 이상 8글자 이하로 입력해주세요',
              hintStyle: register_profile_placeholder,
            ),
            onChanged: (value) {
              setState(() {
                _profileUserNickController = value;
              });
            },
            autovalidateMode: autoValidateMode,
            validator: (value) {
              if ((value?.length == 0 || value?.length == 1) ?? true) {
                return '올바른 형식으로 입력해주세요';
              }
            },
          ),
        ],
      ),
    );
  }

  SizedBox ProfileUserSelfIntroduction(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('소개', style: register_profile_title),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: TextFormField(
              cursorColor: SECOND_COLOR,
              style: co_create_textfield_write,
              maxLines: null,
              minLines: 12,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'dddd',
                suffixStyle: const TextStyle(
                  fontSize: 12.0,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20), // 내부 패딩 설정
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget RenderProfileRegisterButton(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print('성공');
            } else {
              setState(() {
                autoValidateMode = AutovalidateMode.always;
              });
            }

            setState(() {
              if (_profileUserSexController.isEmpty) _showError = true;
            });

            (_profileUserNameController.isNotEmpty &&
                        _profileUserBirthController.length == 8 &&
                        _profileUserSexController.isNotEmpty &&
                        (_profileUserNickController.length >= 2 &&
                            _profileUserNickController.length <= 8)) ==
                    true
                ? Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => AddressSearchScreen()))
                : null;
          },
          style: (_profileUserNameController.isNotEmpty &&
                      _profileUserBirthController.length == 8 &&
                      _profileUserSexController.isNotEmpty &&
                      (_profileUserNickController.length >= 2 &&
                          _profileUserNickController.length <= 8)) ==
                  true
              ? ElevatedButton.styleFrom(backgroundColor: MAIN_COLOR)
              : ElevatedButton.styleFrom(backgroundColor: Colors.grey[500]),
          child: Text(
            '다음',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}
