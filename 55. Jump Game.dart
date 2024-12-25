
void main() {
  print(Solution().canJump([2,3,1,1,4])); // true
  print(Solution().canJump([3,2,1,0,4])); // false
  print(Solution().canJump([3,2,2,0,4])); // true
}

// 0 1 2 3
// 1 2 3 4

class Solution {
  bool canJump(final List<int> nums) {

    int jumpAt = nums.length-1;
    for (int i = nums.length-2; i >= 0; i--) {
      if (nums[i] >= jumpAt-i) {
        jumpAt = i;
      }
    }

    return jumpAt == 0;
  }
}


// class Solution {
//   bool canJump(final List<int> nums) {
//     int jumpAt = nums.length -1;
//     int distance = 0;
//     for (int i = nums.length-2; i >= 0; i--) {
//       distance++;
//       if (nums[i] >= jumpAt-i) {
//         jumpAt -= distance;
//         distance = 0;
//       }
//     }
//     return jumpAt == 0;
//   }
// }