import 'package:flutter/material.dart';
import 'package:treepet/screen/family/wedding/wedding_list_post_screen.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_1.dart';
import '../../../const/color.dart';
import '../../../layout/screen_layout.dart';

class WeddingScreen extends StatelessWidget {
  const WeddingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(context),
      body: ScreenLayout(
        title: '신랑&신부 찾기',
        body: renderWeddingListPost(),
        screenKey: 'wedding',
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const WeddingPostCreateScreen1()));
      },
      backgroundColor: MAIN_COLOR,
      child: const Icon(
        Icons.add,
      ),
    );
  }

  renderWeddingListPost() {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Column(
            children: const [
              WeddingListPost(
                title: '예쁘디 예쁜 우리 예삐 신랑찾아요~!',
                nickName: '야무진개발자',
                location: '서울 은평구',
                petKind: "강아지",
                petVariety: '비숑',
                petGender: '수컷',
                petAge: 1,
                petWeight: 1.6,
                comment: 245,
              ),
            ],
          );
        },
      ),
    );
  }
}
