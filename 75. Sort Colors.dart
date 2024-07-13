
void main() {
  List<int> input = [2,0,2,1,1,0];
  Solution().sortColors(input);
  print(input);

  input = [2,0,1];
  Solution().sortColors(input);
  print(input);
}

// Red -> 0
// White -> 1
// Blue -> 2

// The Dutch National Flag Problem
class Solution {
  void sortColors(final List<int> nums) {
    int low = 0, mid = 0, high = nums.length-1;
    while (mid <= high) {
      if (nums[mid] == 0) {
        _swipe(nums, low++, mid++);
      } else if (nums[mid] == 1) {
        mid++;
      } else {
        _swipe(nums, mid, high--);
      }
    }
  }

  void _swipe(final List<int> nums, final int i, final int j) {
    final int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }
}