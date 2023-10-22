
void main(List<String> args) {
  List<int> nums = [1,2,0]; // 3
  print(Solution().firstMissingPositive(nums));
  nums = [3,4,-1,1]; // 2
  print(Solution().firstMissingPositive(nums));
  nums = [7,8,9,11,12]; //1
  print(Solution().firstMissingPositive(nums));
  nums = [1, 1]; //1
  print(Solution().firstMissingPositive(nums));

  // Solution set is List<int> solutionSet = [1...len(nums)+1]
}

class Solution {
  int firstMissingPositive(List<int> nums) {
    int length = nums.length;

    // 1. Replace num <= 0 by len+1
    for(int i = 0; i < length; i++) {
      if(nums[i] <= 0) {
        nums[i] = length+1;
      }
    }

    // 2. Make -ve
    for(int i = 0; i < length; i++) {
      int index = nums[i].abs() -1;
      if(index < length && nums[index] > 0) {
        nums[index] *= -1;
      }
    }

    // 3. Find +ve
    for(int i = 0; i < length; i++) {
      if(nums[i] > 0) {
        return i+1;
      }
    }

    return length +1;
  }
}