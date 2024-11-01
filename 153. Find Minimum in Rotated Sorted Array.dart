
void main() {
  print(Solution().findMin([3,4,5,1,2])); // 1
  print(Solution().findMin([4,5,6,7,0,1,2])); // 0
  print(Solution().findMin([11,13,15,17])); // 11
}

class Solution {
  int findMin(final List<int> nums) {

    final int length = nums.length;
    int low = 0, high = length - 1;

    while (low < high) {
      final int mid = (low + high) ~/ 2;
      final int next = (mid + 1) % length;
      final int previous =  (mid + 1 + length) % length;

      if (nums[low] < nums[high]) {
        break;
      }

      if (nums[mid] < nums[previous] && nums[mid] < nums[next]) {
        return nums[mid];
      }

      if (nums[low] < nums[mid]) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return nums[low];
  }
}