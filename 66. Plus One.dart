
void main() {
  print(Solution().plusOne([1,2,3])); // [1, 2, 4]
  print(Solution().plusOne([4,3,2,1])); // [4, 3, 2, 2]
  print(Solution().plusOne([9])); // [1, 0]
  print(Solution().plusOne([9,9])); // [1, 0, 0]
  print(Solution().plusOne([1,9,1,9])); // [1, 9, 2, 0]
  print(Solution().plusOne([1,9,9,9])); // [2, 0, 0, 0]
}

//  0 1 2
// [1,2,3]
//     +1
// [1,2,4]

class Solution {
  List<int> plusOne(final List<int> digits) {
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