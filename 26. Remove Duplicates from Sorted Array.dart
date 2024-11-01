
void main() {
  print(Solution().removeDuplicates([1,1,2]));  // [1,2,_]
  print(Solution().removeDuplicates([0,0,1,1,1,2,2,3,3,4]));  // [0,1,2,3,4,_,_,_,_,_]
}

class Solution {
  int removeDuplicates(List<int> nums) {
    final int maxUniques = 1;

    if (nums.length < maxUniques) {
      return nums.length;
    }

    int count = maxUniques;
    for (int i = maxUniques; i < nums.length; i++) {
      if (nums[count - maxUniques] != nums[i]) {
        nums[count] = nums[i];
        count++;
      }
    }

    print(nums);

    return count;
  }
}