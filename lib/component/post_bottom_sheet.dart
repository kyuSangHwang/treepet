import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class PostBottomSheet extends StatefulWidget {
  final void Function(String value) onCategoryOptionChanged;
  final String selectedBeforeCategoryOption;

  const PostBottomSheet({
    required this.onCategoryOptionChanged,
    required this.selectedBeforeCategoryOption,
    Key? key,
  }) : super(key: key);

  @override
  State<PostBottomSheet> createState() => _PostBottomSheetState();
}

class _PostBottomSheetState extends State<PostBottomSheet> {
  late String option = widget.selectedBeforeCategoryOption.isNotEmpty ? widget.selectedBeforeCategoryOption : "1";
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
            _CategoryButton(
              title: '자유',
              value: '1',
            ),
            _CategoryButton(
              title: '일상',
              value: '2',
            ),
            _CategoryButton(
              title: '질문',
              value: '3',
            ),
            _CategoryButton(
              title: '육아일기',
              value: '4',
            ),
          ],
        ),
      ),
    );
  }

  RadioListTile _CategoryButton({required String title, required value}) {
    return RadioListTile(
      title: Text(title, style: co_create_option_bottom_sheet),
      value: value,
      groupValue: option,
      onChanged: (value) {
        setState(() {
          option = value!;
          widget.onCategoryOptionChanged(value);
        });
      },
      secondary: option == value ? const Icon(Icons.check) : null,
    );
  }
}
