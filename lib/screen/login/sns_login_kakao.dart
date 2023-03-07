import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:treepet/kakao_login.dart';
import 'package:treepet/main_view_model.dart';

class SnsLoginKakao extends StatefulWidget {
  final String title;

  const SnsLoginKakao({Key? key, required this.title}) : super(key: key);

  @override
  State<SnsLoginKakao> createState() => _SnsLoginKakaoState();
}

class _SnsLoginKakaoState extends State<SnsLoginKakao> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return ElevatedButton(
                  onPressed: () async {
                    await viewModel.login();
                    setState(() {});
                  },
                  child: const Text('Login'),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                      viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
                  Text(
                    '${viewModel.isLogined}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(viewModel.user?.kakaoAccount?.profile?.nickname.toString() ?? ''),
                  Text(viewModel.user?.kakaoAccount?.email.toString() ?? ''),

                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.logout();
                      setState(() {});
                    },
                    child: const Text('Logout'),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}