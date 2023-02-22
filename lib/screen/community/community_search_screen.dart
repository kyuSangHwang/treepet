import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class CommunitySearchScreen extends StatefulWidget {
  const CommunitySearchScreen({Key? key}) : super(key: key);

  @override
  _CommunitySearchScreenState createState() => _CommunitySearchScreenState();
}

class _CommunitySearchScreenState extends State<CommunitySearchScreen> {
  final List<String> _data = [
    '안녕하세요~!',
    '안녕하세요~! 잘지냈나요',
    '날씨가 좋네요',
    '인생 뭐있어~~',
    '가나다라마바사??',
    '아따매 오늘 좋다잉',
    '뭉치가 아주 좋아하네 ㅎㅎ',
    '산책 오늘 해도 되나?',
    '대박이다!!',
    '영양제 뭐로 먹어야하나...',
    '다들 사료 뭐 먹여요?',
    'Djibouti',
    'Egypt',
    'Eritrea',
    'Ethiopia',
    'Gambia',
    'Ghana'
  ];

  late List<String> _filteredData;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Search'),
      // ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(30)),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: OutlineSearchBar(
                    textEditingController: _searchTextController,
                    borderRadius: BorderRadius.circular(10.0),
                    hintText: '무엇이든 검색해보세요',
                    onKeywordChanged: (searchText) {
                      setState(() {
                        _filteredData = _data
                            .where((item) => item
                                .toLowerCase()
                                .contains(searchText.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
