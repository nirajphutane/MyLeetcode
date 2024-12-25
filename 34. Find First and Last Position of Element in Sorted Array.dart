
void main() {
  print(Solution().searchRange([5,7,7,8,8,10], 8)); // [3, 4]
  print(Solution().searchRange([5,7,7,8,8,10], 6)); // [-1, -1]
  print(Solution().searchRange([], 0));  // [-1, -1]
}

class Solution {
  List<int> searchRange(final List<int> nums, final int target) => [
    _binarySearch(nums, target, true),
    _binarySearch(nums, target, false)
  ];

  int _binarySearch(final List<int> nums, final int target, final bool applyLeftBias) {

    int index = -1, low = 0, high = nums.length-1;
    while (low <= high) {
      final int mid = (low + high) ~/2;
      if (nums[mid] == target) {
        index = mid;
        if (applyLeftBias) {
          high = mid - 1;
        } else {
          low = mid + 1;
        }
      } else {
        if (nums[mid] < target) {
          low = mid + 1;
        } else {
          high = mid -1;
        }
      }
    }

    return index;
  }
}