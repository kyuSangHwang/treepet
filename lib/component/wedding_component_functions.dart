
/// 배열에 두 [Integer]를 포함한 사이의 수를 넣어서 return 한다.
List<String> createNumberList(int startNumber, int endNumber) {
  List<String> numbers = [];
  for (int i = startNumber; i <= endNumber; i++) {
    numbers.add(i.toString());
  }
  return numbers;
}

