void main() {
  print(Solution().searchInsert([1,3,5,6], 5));  // 2
  print(Solution().searchInsert([1,3,5,6], 2));  // 1
  print(Solution().searchInsert([1,3,5,6], 7));  // 4
}

class Solution {
  int searchInsert(final List<int> nums, final int target) {

    int low = 0, high = nums.length-1;
    while (low <= high) {
      final int mid = (low + high) ~/2;
      if (nums[mid] == target) {
        return mid;
      }

      if (nums[mid] < target) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return low;
  }

  // int searchInsert(final List<int> nums, final int target) {
  //   int i = 0;
  //   while(i < nums.length) {
  //     if(target <= nums[i]) {
  //       return i;
  //     }
  //     i++;
  //   }
  //   return i++;
  // }
}