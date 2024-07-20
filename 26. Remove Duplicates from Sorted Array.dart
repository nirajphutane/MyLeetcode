void main() {

  List<int> nums = [0,0,1,1,1,2,2,3,3,4];
  print(Solution().removeDuplicates(nums));
}

class Solution {
  int removeDuplicates(List<int> nums) {
    int j = 1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] != nums[j]) {
        j++;
      }
      nums[j] = nums[i];
    }
    return j;
  }
}

// class Solution {
//   int removeDuplicates(List<int> nums) {
//     int j = 1;
//     for(int i = 1; i < nums.length; i++) {
//       if(nums[i-1] != nums[i]) {
//         nums[j] = nums[i];
//         j++;
//       }
//     }
//     return j;
//   }
// }