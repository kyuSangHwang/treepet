import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

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
        height: MediaQuery.of(context).size.height * 0.25,
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
          ],
        ),
      ),
    );
  }

  CategoryButton({required String title, required value}) {
    return RadioListTile(
      title: Text(title),
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
