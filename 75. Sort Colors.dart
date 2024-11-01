
// The Dutch National Flag Problem

void main() {
  List<int> list = [2,0,2,1,1,0];
  Solution().sortColors(list);
  print(list);  // [0,0,1,1,2,2]

  list = [2,0,1];
  Solution().sortColors(list);
  print(list);  // [0,1,2]
}

class Solution {
  void sortColors(final List<int> nums) {
    int low = 0, mid = 0, high = nums.length-1;
    while(mid <= high) {
      if (nums[mid] == 0) {
        _swap(nums, low++, mid++);
      } else if (nums[mid] == 1) {
        mid++;
      } else {
        _swap(nums, mid, high--);
      }
    }
  }

  void _swap(final List<int> nums, final int i, final int j) {
    final int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }
}