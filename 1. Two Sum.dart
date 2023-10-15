void main(){
  List<int> nums = [2,7,11,15];
  int target = 9;

  print(Solution().twoSum(nums, target));
}

class Solution {
  List<int> twoSum(List<int> nums, int target) {

    Map<int, int> map = {};
    int sunstraction;
    for(int i = 0; i< nums.length; i++) {
      sunstraction = target - nums[i];
      if(map.containsKey(nums[i])) {
        return [map[nums[i]]!, i];
      }
      map[sunstraction] = i;
    }

    return [];
  }
}