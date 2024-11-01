
void main() {
  print(Solution().myAtoi(''));           // 0
  print(Solution().myAtoi('   0'));       // 0
  print(Solution().myAtoi('-1'));         // -1
  print(Solution().myAtoi('42'));         // 42
  print(Solution().myAtoi('   -042'));    // -42
  print(Solution().myAtoi('1337c0d3'));   // 1337
  print(Solution().myAtoi('A-1337c0d3')); // -1337
}

class Solution {
  int myAtoi(final String s) {
    int startIndex = -1, number = 0;
    for (int i = 0; i < s.length; i++) {
      final int ascii = s.codeUnitAt(i);
      if (startIndex != -1 && !(ascii >= 48 && ascii <= 57)) {
        break;
      }
      if (ascii >= 48 && ascii <= 57) {
        if (startIndex == -1) {
          startIndex = i;
        }
        number = (number * 10) + (ascii % 48);
      }
    }
    if (startIndex-1 >= 0 && s[startIndex-1] == '-') {
      number = -1 * number;
    }
    return number;
  }
}