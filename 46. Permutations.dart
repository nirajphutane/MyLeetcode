
void main(List<String> args) {
  // [1,2,3] --> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  // Length is 3: So permutations will be 3! = 3 * 2 * 1 = 6
  // Length is 2: So permutations will be 2! = 2 * 1 = 2

  // 1    2    3
  //--   --   --
  // 2    1    1
  // 3    3    2
  //--   --   --
  // 3    3    2
  // 2    1    1

  List<int> nums = [1, 2, 3];   // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  print(Solution().permute(nums));

  nums = [1, 2];  // [[1, 2], [2, 1]]
  print(Solution().permute(nums));

  nums = [1];  // [[1]]
  print(Solution().permute(nums));
}

class Solution {
  List<List<int>> permute(List<int> nums) {
    List<List<int>> permutations = [];
    permutation(permutations, nums, 0);
    return permutations;
  }

  void permutation(List<List<int>> permutations, List<int> nums, int startIndex) {
    if(startIndex == nums.length) {
      permutations.add(List.from(nums));
    } else {
      for(int i = startIndex; i < nums.length; i++) {
        swap(nums, i, startIndex);
        permutation(permutations, nums, startIndex+1);
        swap(nums, i, startIndex);
      }
    }
  }

  void swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }
}