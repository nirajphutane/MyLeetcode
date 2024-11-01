
void main() {
  print(Solution().permute([1,2,3])); // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  print(Solution().permute([0,1])); // [[0,1],[1,0]]
  print(Solution().permute([1])); // [[1]]
}

class Solution {
  List<List<int>> permute(final List<int> nums) {
    final List<List<int>> permutations = [];
    _permute(nums, 0, permutations);
    return permutations;
  }

  void _permute(final List<int> nums, int startIndex, final List<List<int>> permutations) {

    if (startIndex == nums.length) {
      permutations.add(List.from(nums));
      return;
    }

    for(int i = startIndex; i < nums.length; i++) {
      _swap(nums, i, startIndex);
      _permute(nums, startIndex+1, permutations);
      _swap(nums, i, startIndex);
    }
  }

  void _swap(final List<int> nums, final int i, final int j) {
    final int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }
}