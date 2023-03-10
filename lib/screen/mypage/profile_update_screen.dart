import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/component/image_pick.dart';
import 'package:treepet/component/warning_text.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
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
      appBar: ProfileUpdateScreenAppBar(context),
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
                        ProfileUpdateUserName(context),
                        SizedBox(height: 40),
                        ProfileUpdateUserBirth(context),
                        SizedBox(height: 40),
                        ProfileUpdateUserSex(context),
                        SizedBox(height: 40),
                        ProfileUpdateUserNick(context),
                        SizedBox(height: 40),
                        ProfileUpdateUserSelfIntroduction(context),
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
    );
  }

  AppBar ProfileUpdateScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      title: const Text('????????? ??????', style: TextStyle(color: BLACK_COLOR)),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: BLACK_COLOR,
        ),
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

  /// ????????? ?????? ?????? ??? [imagesWidgetList]??? ????????? ????????? ????????????
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

  SizedBox ProfileUpdateUserName(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('??????', style: register_profile_title),
          TextFormField(
            style: register_profile_content,
            inputFormatters: [
              LengthLimitingTextInputFormatter(8),
            ],
            decoration: InputDecoration(
              hintText: '????????? ??????????????????',
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
                return '????????? ???????????? ??????????????????';
              }
            },
          ),
        ],
      ),
    );
  }

  SizedBox ProfileUpdateUserBirth(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('????????????', style: register_profile_title),
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
                return '????????? ???????????? ??????????????????';
              }
            },
          ),
        ],
      ),
    );
  }

  SizedBox ProfileUpdateUserSex(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('??????', style: register_profile_title),
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
                        _profileUserSexController = '??????';
                        _showError = false;
                      });
                    },
                    child: Text('??????'),
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
                        _profileUserSexController = '??????';
                        _showError = false;
                      });
                    },
                    child: Text('??????'),
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

  SizedBox ProfileUpdateUserNick(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('?????????', style: register_profile_title),
          TextFormField(
            style: register_profile_content,
            inputFormatters: [
              LengthLimitingTextInputFormatter(8),
            ],
            decoration: InputDecoration(
              hintText: '2?????? ?????? 8?????? ????????? ??????????????????',
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
                return '????????? ???????????? ??????????????????';
              }
            },
          ),
        ],
      ),
    );
  }

  SizedBox ProfileUpdateUserSelfIntroduction(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('??????', style: register_profile_title),
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
                    vertical: 15, horizontal: 20), // ?????? ?????? ??????
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomAppBar RenderProfileRegisterButton(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print('??????');
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
                // ? Navigator.of(context).push(
                // MaterialPageRoute(builder: (_) => AddressSearchScreen()))
                ? Navigator.of(context).pop()
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
            '?????? ??????',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}
