import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/home_screen.dart';
import 'package:treepet/screen/sign/pet_register_screen.dart';

class PetRegisterCompleteScreen extends StatelessWidget {
  const PetRegisterCompleteScreen({Key? key}) : super(key: key);

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
          RenderStartButton(context),
        ],
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
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
        },
        child: Text('트리펫 시작하기', style: not_pet_register_button),
      ),
    );
  }
}
