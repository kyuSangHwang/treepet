import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../layout/screen_layout.dart';

class WeddingScreen extends StatelessWidget {
  const WeddingScreen({Key? key}) : super(key: key);

  get NAME => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenLayout(
        title: '신랑&신부 찾기',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: const Text("create button",
                  style: TextStyle(color: Colors.redAccent, fontSize: 30)),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('user')
                    .doc('TREEPET_USER_1')
                    .set({'NAME': "유상우", 'GENDER': '여성', 'AGE': 30});
              },
            ),
            ElevatedButton(
              child: const Text("read button",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 30)),
              onPressed: () async {
                QuerySnapshot querySnapshot =
                    await FirebaseFirestore.instance.collection('user').get();
                final allData =
                    querySnapshot.docs.map((doc) => doc.data()).toList();

                print(allData);

              },
            ),
            ElevatedButton(
              child: const Text("update button",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 30)),
              onPressed: () {
                FirebaseFirestore.instance.collection ('user').doc('TREEPET_USER_1').update({'GENDER': '남성'});
              },
            ),
            ElevatedButton(
              child: const Text("delete button",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 30)),
              onPressed: () {
                FirebaseFirestore.instance.collection ('user').doc('TREEPET_USER_1').delete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
