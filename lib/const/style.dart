import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

/* 텍스트 스타일 */
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



// 커뮤니티 게시글 상세페이지 좋아요

/* Padding 스타일 */
// 게시글 화면 왼쪽부터 항목들 패딩
post_item_left_padding() {
  return const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0);
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
