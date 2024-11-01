
void main() {
  print(Solution().twoSum([2,7,11,15], 9)); // [0, 1]
  print(Solution().twoSum([3,2,4], 6)); // [1, 2]
  print(Solution().twoSum([3,3], 6)); // [0, 1]
}

class Solution {
  List<int> twoSum(final List<int> nums, final int target) {
    final Map<int, int> map = {};
    int i = 0;
    while (i < nums.length) {
      if (map.containsKey(nums[i])) {
        break;
      }
      map[target - nums[i]] = i;
      i++;
    }
    return [map[nums[i]]!, i];
  }
}