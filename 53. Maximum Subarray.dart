

import 'dart:math';

void main() {
  print(Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])); // 6
  print(Solution().maxSubArray([1])); // 1
  print(Solution().maxSubArray([5,4,-1,7,8])); // 23
}

class Solution {
  int maxSubArray(final List<int> nums) {

    int sum = 0, maxSum = 0;
    for (int n in nums) {
      sum = max(n, sum+n);
      maxSum = max(sum, maxSum);
    }

    return maxSum;
  }
}