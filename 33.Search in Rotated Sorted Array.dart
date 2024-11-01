
void main() {
  print(Solution().search([4,5,6,7,0,1,2], 0)); // 4
  print(Solution().search([4,5,6,7,0,1,2], 3)); // -1
  print(Solution().search([1], 0)); // -1

  for (int i = 0; i <= 7; i++) {
    final int position = Solution().search([4,5,6,7,0,1,2], i);
    if (position == -1) {
      print('$i not fount.');
    } else {
      print('$i fount at $position th position.');
    }
  }

}

class Solution {

  int search(final List<int> nums, final int target) {
    final int startIndex = _findMin(nums);

    final int leftResult = _binarySearch(nums.sublist(0, startIndex), target);
    if (leftResult != -1) {
      return leftResult;
    }

    final int rightResult = _binarySearch(nums.sublist(startIndex, nums.length), target);
    if (rightResult != -1) {
      return startIndex + rightResult;
    }

    return -1;
  }

  int _binarySearch (final List<int> nums, final int target) {
    int low = 0, high = nums.length -1;
    while (low <= high) {
      final int mid = (low + high) ~/2;
      if (nums[mid] == target) {
        return mid;
      }

      if (target < nums[mid]) {
        high = mid -1;
      } else {
        low = mid +1;
      }
    }

    return -1;
  }

  int _findMin(final List<int> nums) {

    final int length = nums.length;
    int low = 0, high = length -1;
    while (low < high) {
      if (nums[low] < nums[high]) {
        break;
      }

      final int mid = (low + high) ~/2;
      final int previous = (length + mid-1) % length;
      final int next = (mid+1) % length;

      if ((nums[mid] < nums[previous]) && (nums[mid] < nums[next])) {
        return mid;
      }

      if (nums[low] < nums[mid]) {
        low = mid +1;
      } else {
        high = mid -1;
      }
    }

    return low;
  }

// int search(final List<int> nums, final int target) {
//
//   int low = 0, high = nums.length-1;
//   while (low <= high) {
//
//     final int mid = (low + high) ~/2;
//     if (nums[mid] == target) {
//       return mid;
//     }
//
//     if (nums[low] < nums[mid]) {
//       if (nums[low] <= target && target < nums[mid]) {
//         high = mid -1;
//       } else {
//         low = mid +1;
//       }
//     } else {
//       if (nums[mid] < target && target <= nums[high]) {
//         low = mid +1;
//       } else {
//         high = mid -1;
//       }
//     }
//   }
//
//   return -1;
// }
}
