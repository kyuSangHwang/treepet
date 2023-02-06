import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

/* 텍스트 스타일 */
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
final co_create_textfield_placeholder = TextStyle(
  fontFamily: 'pretendard',
  color: Colors.grey[100],
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
