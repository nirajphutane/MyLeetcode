
import 'dart:math';

void main() {
  print(Solution().findMin([1,3,5])); // 1
  print(Solution().findMin([2,2,2,0,1])); // 0
}

class Solution {
  int findMin(final List<int> nums) {
    int low = 0, high = nums.length-1, minimum = nums[low];
    while (low < high) {
      if (nums[low] < nums[high]) {
        minimum = nums[low];
        break;
      }

      final int mid = (low + high) ~/2;

      if ((nums[low] == nums[mid]) && (nums[mid] == nums[high])) {
        low++;
        high--;
        continue;
      }

      if (nums[low] <= nums[mid]) {
        minimum = min(minimum, nums[low]);
        low = mid +1;
      } else {
        minimum = min(minimum, nums[mid]);
        high = mid -1;
      }
    }

    return minimum;
  }
}