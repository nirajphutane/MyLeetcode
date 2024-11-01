
void main() {
  print(Solution().addBinary('11', '1'));  // 100
  print(Solution().addBinary('11', '11'));  // 110
  print(Solution().addBinary('1010', '1011'));  // 10101
}

class Solution {
  String addBinary(final String a, final String b) {
    String addition = '';
    int sum = 0, i = a.length-1, j = b.length-1;
    while ((i >= 0 || j >= 0) || (sum != 0)) {
      if (i >= 0) {
        sum += int.parse(a[i]);
        i--;
      }

      if (j >= 0) {
        sum += int.parse(b[j]);
        j--;
      }

      addition = '${sum % 2}$addition';
      sum ~/= 2;
    }

    return addition;
  }
}