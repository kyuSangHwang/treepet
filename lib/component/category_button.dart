import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  final int beforeButtonIndex;
  final String buttonName;
  final int buttonIndex;
  final String buttonContent;
  final int? visibleIndex;

  const CategoryButtons({
    required this.beforeButtonIndex,
    required this.buttonName,
    required this.buttonIndex,
    required this.buttonContent,
    this.visibleIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryButtons> createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 97.0,
      height: 35.0,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (widget.visibleIndex != null) {
              // _updateButtonState(widget.buttonName, widget.buttonIndex, widget.visibleIndex);
            } else {
              // _updateButtonState(widget.buttonName, widget.buttonIndex);
            }
          });
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: widget.beforeButtonIndex == widget.buttonIndex
              ? Colors.white
              : Colors.grey[700],
          backgroundColor: widget.beforeButtonIndex == widget.buttonIndex
              ? Colors.green
              : Colors.grey[300],
        ),
        child: Text(widget.buttonContent),
      ),
    );
  }
}
