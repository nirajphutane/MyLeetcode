void main() {

  List<int> nums = [5,7,7,8,8,10];
  int target = 8;
  print(Solution().searchRange(nums, target));
}

class Solution {
  List<int> searchRange(List<int> nums, int target) {
    List<int> indexs = [-1, -1];
    indexs[0] = binarySearch(nums, target, true);
    indexs[1] = binarySearch(nums, target, false);
    return indexs;
  }

  int binarySearch(List<int> nums, int target, bool leftBias) {
    int i = -1, l = 0, r = nums.length -1;
    while(l <= r) {
      int mid = (l + r)~/2;
      if(target == nums[mid]) {
        i = mid;
        if(leftBias) {
          r = mid - 1;
        } else {
          l = mid + 1;
        }
      } else if(target < nums[mid]) {
        r = mid - 1;
      } else {
        l = mid + 1;
      }
    }
    return i;
  }
}