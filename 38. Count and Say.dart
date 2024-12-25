
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

  // String _countAndSay(final String str) {
  //   String countAndSay = '';
  //   int count = 1;
  //   for(int i = 1; i < str.length; i++) {
  //     if (str[i] == str[i-1]) {
  //       count++;
  //     } else {
  //       countAndSay += '$count${str[i-1]}';
  //       count = 1;
  //     }
  //   }
  //   return countAndSay += '$count${str[str.length-1]}';
  // }

  // String _countAndSay(final String str) {
  //   String say = '';
  //   int i = 0, j = 0;
  //   while(j < str.length) {
  //     if (str[j] != str[i]) {
  //       say += '${j-i}${str[i]}';
  //       i = j;
  //     }
  //     j++;
  //   }
  //   return say += '${j-i}${str[i]}';
  // }
}