import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/home_screen.dart';
import 'package:treepet/screen/sign/pet_register_screen.dart';

class UserSignUpCompleteScreen extends StatelessWidget {
  UserSignUpCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            color: Colors.blue,
          ),
          SizedBox(height: 50),
          RenderPetRegisterButton(context),
          SizedBox(height: 10),
          RenderStartButton(context),
        ],
      ),
    );
  }

  Widget RenderPetRegisterButton(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: MAIN_COLOR,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/petRegisterScreen', arguments: {'firstRegisterValue': true});
        },
        child: Text('반려동물 등록하기', style: pet_register_button),
      ),
    );
  }

  Widget RenderStartButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
        child: Text('트리펫 시작하기', style: not_pet_register_button),
      ),
    );
  }
}
