
void main(List<String> args) {
  // 1 = "1"
  // 2 = "11"
  // 3 = "21"
  // 4 = "1211"
  // 5 = "111221"
  // 6 = "312211"
  // 7 = "13112221"

  print(Solution().countAndSay(4));
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

// class Solution {
//   String countAndSay(int n) {
//     String res = '';
//     int i = 1;
//     while (i++ <= n) {
//       res = _count(res);
//     }
//     return res;
//   }
//
//   String _count(String str) {
//     if (str.isEmpty) {
//       return '1';
//     }
//     String countAndSay = '';
//     int count = 0, frequency = 0;
//     while (count < str.length) {
//       if (str[frequency] != str[count]) {
//         countAndSay += '${count-frequency}${str[frequency]}';
//         frequency = count;
//       }
//       count++;
//     }
//     countAndSay += '${count-frequency}${str[frequency]}';
//     return countAndSay;
//   }
// }

// class Solution {
//   String countAndSay(int n) {
//     if(n == 1) {
//       return '1';
//     }
//
//     return count(countAndSay(n-1));
//   }
//
//   String count(String str) {
//     String result = '';
//
//     int frequency = 0, count = 0;
//     while(count < str.length) {
//       if(str[frequency] != str[count]) {
//         result += (count - frequency).toString();
//         result += str[count -1];
//         frequency = count;
//       }
//       count++;
//     }
//     result += (count - frequency).toString();
//     result += str[count -1];
//
//     return result;
//   }
// }