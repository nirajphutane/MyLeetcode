
void main() {
  print(Solution().addBinary('11', '1'));       //   100
  print(Solution().addBinary('1010', '1011'));  // 10101
  print(Solution().addBinary('1101', '10001')); // 11110
}

class Solution {
  String addBinary(String a, String b) {
    String addition = '';

    int carry = 0;
    for (int i = a.length-1, j = b.length-1; i >= 0 || j >= 0 || carry != 0; i--, j--) {

      int sum = carry;

      if (i >= 0) {
        sum += int.parse(a[i]);
      }

      if (j >= 0) {
        sum += int.parse(b[j]);
      }

      addition = (sum % 2).toString() + addition;
      carry = sum ~/ 2;
    }

    return addition;
  }
}