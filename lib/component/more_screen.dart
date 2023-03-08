import 'package:flutter/material.dart';
import 'package:treepet/component/more_report_screen.dart';
import 'package:treepet/const/style.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyMoreScreen(context);
  }

  // 작성자 입장에서의 더보기 팝업
  Widget MyMoreScreen(BuildContext context) {
    return Container(
      height: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
                child: Center(
                  child: Text(
                    '더보기 옵션',
                    style: more_view_modal_small_title,
                  ),
                ),
              ),
              thin_sized_box_style(),
              //수정하기 버튼
              TextButton(
                onPressed: () {
                  print('수정하기 버튼 클릭');
                },
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      '수정하기',
                      style: more_view_modal,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
가                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => MoreReportCreateScreen()));
                  // Navigator.of(context).pushNamed('MoreReportCreateScreen');
                },
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      '신고하기',
                      style: more_view_modal,
                    ),
                  ),
                ),
              ),
              thin_sized_box_style(),
              // 삭제하기 버튼
              TextButton(
                onPressed: () {
                  print('삭제하기 버튼 클릭');
                },
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      '삭제하기',
                      style: more_view_modal,
                    ),
                  ),
                ),
              ),
              thin_sized_box_style(),
            ],
          ),
          thin_sized_box_style(),
          // 취소 버튼
          TextButton(
            onPressed: () {
              print('취소 버튼 클릭');
            },
            child: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  '취소',
                  style: more_view_modal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 작성자 외 사람들이 볼때의 더보기 팝업
  Widget OtherMoreScreen() {
    return Container(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
                child: Center(
                  child: Text(
                    '더보기 옵션',
                    style: more_view_modal_small_title,
                  ),
                ),
              ),
              thin_sized_box_style(),
              TextButton(
                onPressed: () {
                  print('신고하기 버튼 클릭');
                },
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      '신고하기',
                      style: more_view_modal,
                    ),
                  ),
                ),
              ),
            ],
          ),
          thin_sized_box_style(),
          // 취소 버튼
          TextButton(
            onPressed: () {
              print('취소 버튼 클릭');
            },
            child: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  '취소',
                  style: more_view_modal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
