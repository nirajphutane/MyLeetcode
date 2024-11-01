
void main() {
  for (int i = 1; i < 10; i++) {
    print('$i. ${Solution().countAndSay(i)}');
  }

  print(Solution().countAndSay(4)); // 1211
  print(Solution().countAndSay(1)); // 1

  // 1. 1
  // 2. 11
  // 3. 21
  // 4. 1211
  // 5. 111221
  // 6. 312211
  // 7. 13112221
}

class Solution {
  String countAndSay(final int n) {
    String countAndSay = '1';
    for (int i = 1; i < n; i++) {
      countAndSay = _countAndSay(countAndSay);
    }
    return countAndSay;
  }

  String _countAndSay(final String string) {
    int count = 1;
    String countAndSay = '';
    for (int i = 1; i < string.length; i++) {
      if (string[i-1] != string[i]) {
        countAndSay += '$count${string[i-1]}';
        count = 0;
      }
      count++;
    }
    countAndSay += '$count${string[string.length-1]}';
    return countAndSay;
  }
}