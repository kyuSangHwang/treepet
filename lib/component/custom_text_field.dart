import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/const/color.dart';

class CustomTextField extends StatelessWidget {
  // true : 제목 ,  false : 내용
  final bool isTitle;
  final String placeHolder;

  const CustomTextField({
    required this.isTitle,
    required this.placeHolder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        renderTextField(),
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      cursorColor: SECOND_COLOR,
      style: TextStyle(fontSize: 20.0),
      maxLines: isTitle ? 1 : null,
      minLines: isTitle ? 1 : 5,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: placeHolder,
        suffixText: isTitle ? '20자 이내' : '300자 이내' ,
        suffixStyle: TextStyle(
          fontSize: 12.0,
        )
      ),
    );
  }
}
