import 'package:flutter/material.dart';
import 'package:treepet/const/style.dart';

Widget RenderWrongInput() {
  return Column(
    children: [
      SizedBox(height: 5),
      Text('올바른 형식으로 입력해주세요', style: wrong_input_warning),
    ],
  );
}