
void main() {
  List<int> list = [1, 2, 3];
  print(Solution().plusOne(list)); // [1, 2, 4]

  list = [1, 9, 9];
  print(Solution().plusOne(list)); // [2, 0, 0]

  list = [9, 9];
  print(Solution().plusOne(list)); // [1, 0, 0]

  list = [9];
  print(Solution().plusOne(list)); // [1, 0]
}

class Solution {
  List<int> plusOne(List<int> digits) {
    for (int i = digits.length-1; i >= 0; i--) {
      if (digits[i] < 9) {
        digits[i]++;
        return digits;
      }
      digits[i] = 0;
    }
    return [1, ...digits];
  }
}