import 'package:flutter/material.dart';
import 'package:treepet/component/wedding_component.dart';

class MyHomePage11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet Demo"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: const [
            WeddingCreateTitleForm(),
            Text("Helle"),
            Text("Helle"),
            Text("Helle"),
          ],
        ),
      ),
    );
  }
}
