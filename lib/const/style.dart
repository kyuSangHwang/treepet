import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:treepet/const/color.dart';

/* 텍스트 스타일 */
/* 회원가입 */
// 회원가입 이용약관 동의 제목
final sign_up_term_agree_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w500,
  color: MAIN_COLOR,
  fontSize: 18.0,
);

// 회원가입 이용약관 동의 제목 강조
final sign_up_term_agree_title1 = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w800,
  color: MAIN_COLOR,
  fontSize: 18.0,
);

// 회원가입 이용약관 동의 카테고리
final sign_up_term_agree_category = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 16.0,
);

/* 이용동의 상세 */
// 이용동의 상세 제목
final access_agreement_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 20,
);

// 이용동의 상세 내용
final access_agreement_content = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);

/* 휴대폰 인증 */
// 휴대폰 인증 제목
final mobile_number_authentication_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 20,
);

// 휴대폰 인증 placeholder
final mobile_number_authentication_placeholder = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[500],
  fontSize: 18,
);

// 휴대폰 인증 아래 알림
final mobile_number_authentication_warning = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[500],
  fontSize: 15,
);

// 선택하라고 경고
final wrong_input_warning = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.redAccent,
  fontSize: 12,
);

// 휴대폰 인증 내용
final mobile_number_authentication_content = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[500],
  fontSize: 18,
);

// 휴대폰 인증 텍스트 필드 작성 글씨
final textfield_write_number = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 16.0,
);

/* 프로필 등록 */
// 프로필 등록 제목
final register_profile_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 20,
);

// 프로필 등록 placeholder
final register_profile_placeholder = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[500],
  fontSize: 20,
);

// 프로필 등록 내용
final register_profile_content = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  fontSize: 20,
);

/* 프로필 등록 완료 */
// 반려동물 등록 버튼
final pet_register_button = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 20,
);

// 반려동물 등록 버튼
final not_pet_register_button = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 20,
);

/* 반려동물 등록 화면 */
// 반려동물 등록 카테고리 타이틀
final pet_register_category_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 18,
);

// 반려동물 등록 카테고리 선택 버튼
final pet_register_category_button = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 18,
);

// 반려동물 등록 품종 입력
final pet_breed = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black87,
  fontSize: 20,
);

// 반려동물 등록 이름 입력
final pet_name = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black87,
  fontSize: 20,
);


// 반려동물 등록 몸무게 입력
final pet_weight = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black87,
  fontSize: 20,
);

// 반려동물 등록 몸무게 서프
final pet_weight_suf = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[600],
  fontSize: 20,
);

// 반려동물 등록 몸무게 헬퍼
final pet_weight_hel = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[600],
  fontSize: 14,
);

// 옵션 선택
final option_select = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w500,
  color: Colors.grey[800],
  fontSize: 20,
);



/* 온보딩 */
PageDecoration getPageDecoration() {
  return const PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyTextStyle: TextStyle(
      fontSize: 18,
      color: Colors.blue,
    ),
    imagePadding: EdgeInsets.only(top: 40),
    pageColor: Colors.orange,
  );
}

/* 커뮤니티 영역 */
// 커뮤니티 목록형 게시글 제목
final co_list_post_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: MAIN_COLOR,
  fontSize: 14.0,
);

// 커뮤니티 목록형 게시글 정보
final co_list_post_title_sub = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: SECOND_COLOR,
  fontSize: 12.0,
);

// 커뮤니티 목록형 게시글 댓글
final co_list_post_comment = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: SECOND_COLOR,
  fontSize: 12.0,
);

// 커뮤니티 글쓰기 중간 제목
final co_create_middle_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: MAIN_COLOR,
  fontSize: 16.0,
);

// 커뮤니티 글쓰기 텍스트 필드 PlaceHolder
final co_create_textfield_write = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 16.0,
);

// 커뮤니티 글쓰기 옵션 버튼들
final co_create_option_button = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w300,
  fontSize: 12.0,
  color: WHITE_COLOR,
);

// 커뮤니티 글쓰기 옵션 내 바텀 시트
final co_create_option_bottom_sheet = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 16.0,
);

// 커뮤니티 게시글 상세페이지 카테고리 (제목 옆)
final co_post_detail_category = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: MAIN_COLOR,
  fontSize: 18,
);

// 커뮤니티 게시글 상세페이지 제목
final co_post_detail_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 18,
);

// 커뮤니티 게시글 상세페이지 사용자 닉네임
final co_post_detail_user_nick = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w500,
  color: BLACK_COLOR,
  fontSize: 14.0,
);

// 커뮤니티 게시글 상세페이지 정보
final co_post_detail_sub_text = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 13.0,
);

// 커뮤니티 게시글 상세페이지 컨텐츠내용
final co_post_detail_contetnt = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w500,
  color: BLACK_COLOR,
  fontSize: 14.0,
);

/* 마이페이지 영역 */
// 프로필

/* 팔로우 팔로워 */
// 팔로우 탭바
final follow_tabbar = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

final follow_list_user_nick = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  fontSize: 18,
);

// 팔로우 반려동물 이름
final follow_list_pet_name = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 15,
);

/* 활동내역 */
// 활동 내역 1번째 탭바
final activity_first_tabbar = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

/* 관심 목록 */
// 관심 목록 탭바
final interested_tabbar = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

/* 마이페이지 우리 가족 */
// 우리 가족 최상단 제목 라인
final pet_tree_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 16.0,
);

// 우리 가족 해당 반려동물 이름
final pet_tree_pet_name = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 20.0,
);

// 우리 가족 해당 반려동물 정보
final pet_tree_pet_info = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[700],
  fontSize: 16.0,
);

// 우리 가족 해당 반려동물 가족 호칭 제목
final pet_tree_call_name = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[600],
  fontSize: 18.0,
);

// 우리 가족 해당 반려동물의 가족 반려동물 이름
final pet_tree_family_pet_name = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 16.0,
);

// 설정 목록 화면
final settings_list_textStyle = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 16,
);

/* 이용약관 */
// 이용약관 제목
final term_of_user_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 20,
);

// 이용약관 내용
final term_of_user_content = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);

/* 개인정보 처리방침 */
// 개인정보 처리방침 제목
final privacy_policy_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: BLACK_COLOR,
  fontSize: 20,
);

// 개인정보 처리방침 내용
final privacy_policy_content = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);

/* FAQ */
// FAQ 제목
final faq_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  fontSize: 18,
);

// FAQ 내용
final faq_concent = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);

/* inquiry */
// inquiry 제목
final inquiry_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black87,
  fontSize: 18,
);

// inquiry 서브 타이틀
final inquiry_sub_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[700],
  fontSize: 14,
);

// inquiry 상태
final inquiry_state = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 12,
);

// inquiry 버튼
final inquiry_bottom_button = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 20,
);

// inquiry 내용
final inquiry_concent = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 14,
);

// inquiry 카테고리
final inquiry_create_category = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 16,
);

/* inquiry 상세화면 */
// inquiry 카테고리
final inquiry_detail_category = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[700],
  fontSize: 18,
);

// inquiry 문의 작성 시간
final inquiry_detail_post_wrtie_time = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[700],
  fontSize: 18,
);

// inquiry 상세 페이지 문의 내용
final inquiry_detail_cotent = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black87,
  fontSize: 18,
);

// inquiry 댓글 작성자
final inquiry_detail_comment_author = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: MAIN_COLOR,
  fontSize: 17,
);

// inquiry 댓글 작성 내용
final inquiry_detail_comment_content = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black87,
  fontSize: 16,
);

// inquiry 댓글 작성 시간
final inquiry_detail_comment_wrtie_time = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.grey[500],
  fontSize: 15,
);

/* Block List */
// Block List 유저 닉네임
final block_list_nick = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  fontSize: 18,
);

// Block List 차단 날짜
final block_list_day = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 15,
);

/* announcement */
// announcement 제목
final announcement_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  fontSize: 16,
);

// announcement 날짜
final announcement_concent = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 14,
);

// announcement 제목
final announcement_detail_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  fontSize: 20,
);

// announcement 날짜
final announcement_detail_sub = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  fontSize: 16,
);

// announcement 내용
final announcement_detail_concent = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);

/* event */
// event 제목
final event_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w700,
  color: BLACK_COLOR,
  fontSize: 18,
);

// event 글자
final event_time_name = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w400,
  color: Colors.grey[700],
  fontSize: 16,
);

// event 날짜
final event_time_concent = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: Colors.black54,
  fontSize: 16,
);

/* 회원탈퇴 */
// 회원탈퇴 제목
final withdrawal_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: MAIN_COLOR,
  fontSize: 18.0,
);

// 회원탈퇴 카테고리
final withdrawal_category = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w600,
  color: BLACK_COLOR,
  fontSize: 16.0,
);

/* 팝업 영역 */
final more_view_modal_small_title = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w200,
  color: Colors.black54,
  fontSize: 16,
);

final more_view_modal = TextStyle(
  fontFamily: 'pretendard',
  fontWeight: FontWeight.w300,
  color: Colors.black87,
  fontSize: 18,
);

/// Wedding ///
const wedding_post_detail_18_500_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_detail_14_300_015 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 14.0,
  fontWeight: FontWeight.w300,
  height: 1.5,
  color: Colors.black,
);

const wedding_post_detail_15_500_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_detail_13_300_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 13.0,
  fontWeight: FontWeight.w300,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_detail_14_400_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_22_400_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_create_20_400_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_create_18_400_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_15_400_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
  height: 1.2,
  color: Colors.black,
);

final wedding_post_create_14_300_012_f = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 14.0,
  fontWeight: FontWeight.w300,
  height: 1.2,
  color: Colors.grey[600],
);

const wedding_post_create_14_300_012 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 14.0,
  fontWeight: FontWeight.w300,
  height: 1.2,
  color: Colors.black,
);

const wedding_post_detail_135_300_014 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 13.5,
  fontWeight: FontWeight.w300,
  height: 1.4,
  color: Colors.black,
);

const wedding_post_detail_145_400_02 = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 14.5,
  fontWeight: FontWeight.w400,
  height: 2,
  color: Colors.black,
);

const wedding_post_detail_145_400_02_d = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 14.5,
  fontWeight: FontWeight.w400,
  height: 2,
  color: Colors.black,
  decoration: TextDecoration.underline,
  decorationColor: Colors.red,
  decorationThickness: 1.5,
);




// 커뮤니티 게시글 상세페이지 좋아요

/* Padding 스타일 */
// 게시글 화면 왼쪽부터 항목들 패딩
post_item_left_padding() {
  return const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0);
}

// 마이페이지 프로필 화면 항목들 패딩
profile_item_left_padding() {
  return const EdgeInsets.symmetric(horizontal: 16, vertical: 0.0);
}

// 마이페이지 프로필 화면 항목들 패딩
settings_item_left_padding() {
  return const EdgeInsets.symmetric(horizontal: 16, vertical: 0.0);
}

/* SizedBox 색 변경 스타일 */
Container sized_box_style() {
  return Container(decoration: BoxDecoration(color: Colors.grey[300]));
}

// 아이템 간의 엄청 얇은 회색 SizedBox
SizedBox thin_sized_box_style() {
  return SizedBox(height: 0.5, child: sized_box_style());
}

// 아이템들 간의 조금 얇은 회색 SizedBox
SizedBox suit_sized_box_style() {
  return SizedBox(height: 10, child: sized_box_style());
}

/* 가로로 가장 긴 버튼 */
big_long_button() {
  return const EdgeInsets.symmetric(horizontal: 16);
}

final big_long_button_text = TextStyle(
  fontFamily: 'pretendard',
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  height: 1.2,
  color: Colors.black,
);
