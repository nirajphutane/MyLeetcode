
void main() {
  print(Solution().singleNumber([2,2,1]));      // 1
  print(Solution().singleNumber([4,1,2,1,2]));  // 4
  print(Solution().singleNumber([1]));          // 1
}

class Solution {
  int singleNumber(final List<int> nums) {
    int n = 0;
    for (final int num in nums) {
      n = n ^ num;
    }
    return n;
  }
}
