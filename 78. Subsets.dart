
void main() {
  print(Solution().subsets([1,2,3])); // [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
  print(Solution().subsets([0])); // [[],[0]]
}

class Solution {
  List<List<int>> subsets(final List<int> nums) {
    final List<List<int>> powerSet = [];
    _subsets(nums, 0, powerSet, []);
    return powerSet;
  }

  void _subsets (final List<int> nums, final int startIndex, final List<List<int>> powerSet, final List<int> tmp) {
    powerSet.add(List.from(tmp));

    for (int i = startIndex; i < nums.length; i++) {
      tmp.add(nums[i]);
      _subsets(nums, i+1, powerSet, tmp);
      tmp.removeLast();
    }
  }
}