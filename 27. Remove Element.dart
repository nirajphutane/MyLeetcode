void main() {
  List<int> nums = [0,1,2,2,3,0,4,2];
  const int val = 2;
  print(Solution().removeElement(nums, val));
}

class Solution {
  int removeElement(List<int> nums, int val) {
    int j = 0;
    for(int i = 0; i < nums.length; i++) {
      if(nums[i] != val) {
        nums[j] = nums[i];
        j++;
      }
    }
    return j;
  }
}