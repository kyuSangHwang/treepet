import 'package:flutter/material.dart';
import 'package:treepet/screen/family/wedding/wedding_screen.dart';
import '../../layout/screen_layout.dart';
import '../community/community_post_create_screen.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenLayout(
        title: '가족 만들기',
        screenKey: 'familyScreen',
        body: _FamilyScreenBody(context),
      ),
    );
  }

  Column _FamilyScreenBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WeddingScreen()));
                    },
                    iconSize: 150,
                    icon: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('asset/image/treepetMale.jpeg'),
                    ),
                  ),
                  const Text(
                    '웨딩',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontFamily: 'pretendard',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 200,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CommunityPostCreateScreen()));
                    },
                    iconSize: 150,
                    icon: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('asset/image/treepetFemale.jpeg'),
                    ),
                  ),
                  const Text(
                    '분양&입양',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'pretendard',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

}
