
void main() {
  print(Solution().search([2,5,6,0,0,1,2], 0)); // true
  print(Solution().search([2,5,6,0,0,1,2], 3)); // false
}

class Solution {
  bool search(List<int> nums, int target) {

    int low = 0, high = nums.length -1;
    while (low < high) {
      final int mid = (low + high) ~/2;

      if (nums[mid] == target) {
        return true;
      }

      if (nums[low] == nums[mid] && nums[mid] == nums[high]) {
        low++;
        high--;
        continue;
      }

      if (nums[low] < nums[mid]) {
        if (nums[low] <= target && target <= nums[mid]) {
          high = mid -1;
        } else {
          low = mid +1;
        }
      } else {
        if (nums[mid] <= target && target <= nums[high]) {
          low = mid +1;
        } else {
          high = mid -1;
        }
      }
    }

    return false;
  }
}