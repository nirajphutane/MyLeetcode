
void main() {
  print(Solution().removeElement([3,2,2,3], 3));  // [2,2,_,_]
  print(Solution().removeElement([0,1,2,2,3,0,4,2], 2));  // [0,1,4,0,3,_,_,_]
  print(Solution().removeElement([2], 3));  // [2]
}

class Solution {
  int removeElement(final List<int> nums, final int val) {
    int count = 0;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != val) {
        nums[count] = nums[i];
        count++;
      }
    }
    print(nums);
    return count;
  }
}