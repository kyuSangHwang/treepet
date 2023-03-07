import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class PostBottomSheet extends StatefulWidget {
  const PostBottomSheet({Key? key}) : super(key: key);

  @override
  State<PostBottomSheet> createState() => _PostBottomSheetState();
}

class _PostBottomSheetState extends State<PostBottomSheet> {
  late String option = '1';
  late final String title;
  late final String value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: WHITE_COLOR,
        child: Column(
          children: [
            CategoryButton(
              title: '자유',
              value: '1',
            ),
            CategoryButton(
              title: '일상',
              value: '2',
            ),
            CategoryButton(
              title: '질문',
              value: '3',
            ),
            CategoryButton(
              title: '육아일기',
              value: '4',
            ),
          ],
        ),
      ),
    );
  }

  // TODO: 뭐에 선택되어있는 등록화면에서 보여주기
  // TODO: 선택한 값이 저장되기
  CategoryButton({required String title, required value}) {
    return RadioListTile(
      title: Text(title, style: co_create_option_bottom_sheet),
      value: value,
      groupValue: option,
      onChanged: (value) {
        setState(() {
          option = value!;
        });
      },
      secondary: option == value ? Icon(Icons.check) : null,
    );
  }
}
