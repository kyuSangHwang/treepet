import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

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
    return Padding(
      padding: post_item_left_padding(),
      child: TextFormField(
        cursorColor: SECOND_COLOR,
        style: co_create_textfield_placeholder,
        maxLines: isTitle ? 1 : null,
        minLines: isTitle ? 1 : 12,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: placeHolder,
          suffixText: isTitle ? '20자 이내' : '1000자 이내' ,
          suffixStyle: TextStyle(
            fontSize: 12.0,
          )
        ),
      ),
    );
  }
}
