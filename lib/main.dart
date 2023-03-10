import 'package:flutter/material.dart';
import 'package:treepet/component/more_report_screen.dart';
import 'package:treepet/screen/community/community_post_create_screen.dart';
import 'package:treepet/screen/community/community_post_detail_screen.dart';
import 'package:treepet/screen/community/community_screen.dart';
import 'package:treepet/screen/community/community_search_screen.dart';
import 'package:treepet/screen/family/family_screen.dart';
import 'package:treepet/screen/family/wedding/wedding_filter_screen.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_1.dart';
import 'package:treepet/screen/family/wedding/wedding_screen.dart';
import 'package:treepet/screen/home_screen.dart';
import 'package:treepet/screen/login/on_boarding_page_ks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:treepet/screen/mypage/activity/activity_detail_screen.dart';
import 'package:treepet/screen/mypage/follow/follow_list_screen.dart';
import 'package:treepet/screen/mypage/interested/interested_screen.dart';
import 'package:treepet/screen/mypage/mypage_screen.dart';
import 'package:treepet/screen/mypage/petTree/pet_tree_view_all.dart';
import 'package:treepet/screen/mypage/profile_update_screen.dart';
import 'package:treepet/screen/mypage/settings/announcement/announcement_post_detail_screen.dart';
import 'package:treepet/screen/mypage/settings/serviceInquiry/service_inquiry_create_screen.dart';
import 'package:treepet/screen/mypage/settings/serviceInquiry/service_inquiry_detail_screen.dart';
import 'package:treepet/screen/mypage/settings/settings_screen.dart';
import 'package:treepet/screen/sign/address_search_screen.dart';
import 'package:treepet/screen/sign/mobile_number_authentication_screen.dart';
import 'package:treepet/screen/sign/pet_register_complete_screen.dart';
import 'package:treepet/screen/sign/pet_register_screen.dart';
import 'package:treepet/screen/sign/pet_register_screen2.dart';
import 'package:treepet/screen/sign/profile_register_screen.dart';
import 'package:treepet/screen/sign/sign_up_term_agree_screen.dart';
import 'package:treepet/screen/sign/user_sign_up_complete_screen.dart';
import 'firebase_options.dart';
import 'package:treepet/screen/onboarding/onboarding_page.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  kakao.KakaoSdk.init(nativeAppKey: 'f05b5a6c8a7cab870019949709340881');
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OnBoardingPageKS(),
      // home: OnboardingPage(),

      initialRoute: '/',
      routes: {
        // '/': (context) => FamilyScreen(),
        /// 웨딩
        '/': (context) => HomeScreen(),
        '/weddingScreen': (context) => const WeddingScreen(),
        '/weddingPostCreateScreen1': (context) => const WeddingPostCreateScreen1(),
        '/weddingFilterScreen': (context) => const WeddingFilterScreen(),

        /// 공용
        '/moreReportCreateScreen': (context) => MoreReportCreateScreen(),



        /// 커뮤니티
        '/communityScreen': (context) => CommunityScreen(),
        '/communitySearchScreen': (context) => const CommunitySearchScreen(),
        '/communityPostDetailScreen': (context) => const CommunityPostDetailScreen(),
        '/communityPostCreateScreen': (context) => const CommunityPostCreateScreen(),
        '/mobileNumberAuthenticationScreen': (context) => const MobileNumberAuthenticationScreen(),
        '/profileRegisterScreen': (context) => const ProfileRegisterScreen(),
        '/addressSearchScreen': (context) => const AddressSearchScreen(),
        '/userSignUpCompleteScreen': (context) => UserSignUpCompleteScreen(),
        '/petRegisterScreen': (context) => PetRegisterScreen(first: true),
        '/petRegisterScreen2': (context) => PetRegisterScreen2(),
        '/petRegisterCompleteScreen': (context) => const PetRegisterCompleteScreen(),


        /// 회원가입
        '/signUpTermAgreeScreen': (context) => const SignUpTermAgreeScreen(),

        /// 마이페이지
        '/myPageScreen': (context) => const MyPageScreen(),
        '/profileUpdateScreen': (context) => const ProfileUpdateScreen(),
        '/followerListScreen': (context) => FollowListScreen(selectedIndex: 0),
        '/followListScreen': (context) => FollowListScreen(selectedIndex: 1),
        '/petTreeViewAll': (context) => const PetTreeViewAll(),
        '/activityDetailScreen': (context) => const ActivityDetailScreen(),
        '/interestedScreen': (context) => const InterestedScreen(),
        '/settingsScreen': (context) => SettingsScreen(),
        '/serviceInquiryCreateScreen': (context) => ServiceInquiryCreateScreen(),
        '/serviceInquiryDetailScreen': (context) => ServiceInquiryDetailScreen(),
        '/announcementPostDetailScreen': (context) => AnnouncementPostDetailScreen(),
      },
    );
  }
}