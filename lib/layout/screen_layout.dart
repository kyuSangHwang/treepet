import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/screen/community/community_search_screen.dart';
import 'package:treepet/screen/family/family_screen.dart';
import 'package:treepet/screen/family/wedding/wedding_filter_screen.dart';

class ScreenLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final String? screenKey;
  final Widget? bottomNavigationBar;
  final Widget? appBarBottom;

  const ScreenLayout({
    required this.title,
    required this.body,
    this.screenKey,
    this.bottomNavigationBar,
    this.appBarBottom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
        backgroundColor: WHITE_COLOR,
        centerTitle: (screenKey == "signUpTermAgree" || screenKey ==  "communityPostCreate") ? false : true,
        titleTextStyle: const TextStyle(
          color: BLACK_COLOR,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        leading: screenKey == 'wedding' || screenKey == "weddingFilter"
            ? IconButton(
                onPressed: () {
                  if (screenKey != null &&
                      (screenKey == "wedding" ||
                          screenKey == "weddingFilter")) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const FamilyScreen()), (route) => false);
                  } else {
                    Navigator.of(context).maybePop();
                  }
                },
                icon: const Icon(Icons.arrow_back, color: BLACK_COLOR),
              )
            : (screenKey == "signUpTermAgree" || screenKey == "communityPostCreate")
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: BLACK_COLOR,
                    ),
                  ) : null,
        actions: screenKey == "wedding"
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const WeddingFilterScreen()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ]
            : screenKey == "weddingFilter"
                ? [
                    TextButton(
                      onPressed: () {
                        /// TODO: 필터 값들 다 제거
                      },
                      child: const Text(
                        '초기화',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ]
                : screenKey == "community"
                    ? [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const CommunitySearchScreen()));
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ]
                    : null,
        bottom: appBarBottom != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: appBarBottom!,
              )
            : null,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar ?? bottomNavigationBar,
    );
  }
}
