
void main () {
  print(Solution().isStrobogrammatic('0'));  // true
  print(Solution().isStrobogrammatic('69'));  // true
  print(Solution().isStrobogrammatic('88'));  // true
  print(Solution().isStrobogrammatic('962')); // false
  print(Solution().isStrobogrammatic('996666699')); // false
}

class Solution {
  bool isStrobogrammatic (final String num) {
    final Map<String, String> strobogrammatic = {
      '0': '0',
      '1': '1',
      '6': '9',
      '8': '8',
      '9': '6'
    };

    int low = 0, high = num.length-1;
    while (low < high) {
      if (num[high] != strobogrammatic[num[low]]) {
        return false;
      }
      low++;
      high--;
    }
    return true;

    // String tmp = '';
    // for (int i = 0; i < num.length; i++) {
    //   if (strobogrammatic.containsKey(num[i])) {
    //     tmp = strobogrammatic[num[i]]! + tmp;
    //   } else {
    //     return false;
    //   }
    // }
    // return tmp == num;
  }
}
