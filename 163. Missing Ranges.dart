
void main() {
  print(Solution().findMissingRange([0, 1, 3, 50, 75], 0, 99)); // [[2, 22], [4, 49], [51, 74], [76, 99]]
  print(Solution().findMissingRange([-1], -1, -1)); // []
}

class Solution {

  List<List<int>> findMissingRange (final List<int> nums, final int lower, final int upper) {
    final List<List<int>> missingRanges = [];
    if (nums.first - lower != 0) {
      missingRanges.add([lower, nums.first-1]);
    }
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] - nums[i-1] != 1) {
        missingRanges.add([nums[i-1]+1, nums[i]-1]);
      }
    }
    if (upper - nums.last >= 1) {
      missingRanges.add([nums.last+1, upper]);
    }
    return missingRanges;
  }
}
