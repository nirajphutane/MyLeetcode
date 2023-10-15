void main() {

  List<int> nums = [1,3,5,6];
  int target = 5;
  print(Solution().searchInsert(nums, target));
}

class Solution {
  // O(log(n))
  int searchInsert(List<int> nums, int target) {
    int low = 0, high = nums.length -1;
    while(low <= high) {
      int mid = (low + high) ~/ 2;
      if(target == nums[mid]) {
        return mid;
      } else if(target < nums[mid]) {
        high = mid -1;
      } else {
        low = mid +1;
      }
    }
    return low;
  }

  // O(n)
  // int searchInsert(List<int> nums, int target) {
  //   int i;
  //   for(i = 0; i < nums.length; i++) {
  //     if(target <= nums[i]) {
  //       return i;
  //     }
  //   }
  //   return i++;
  // }
}