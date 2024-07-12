
void main() {
  print(Solution().subsets([1, 2, 3]));
  print(Solution().subsets([0]));
}


class Solution {
  List<List<int>> subsets(final List<int> nums) {
    final List<List<int>> powerSet = [[]];
    final List<int> tmp = [];
    _makeSubsets(nums, 0, tmp, powerSet);
    return powerSet;
  }

  void _makeSubsets (final List<int> nums, final int index, final List<int> tmp, final List<List<int>> powerSet) {
    for (int i = index; i < nums.length; i++) {
      tmp.add(nums[i]);
      powerSet.add(List.of(tmp));
      _makeSubsets(nums, i + 1, tmp, powerSet);
      tmp.removeLast();
    }
  }

}

// class Solution {
//   List<List<int>> subsets(final List<int> nums) {
//     final List<List<int>> powerSet = [[]];
//     for (int num in nums) {
//       final int size = powerSet.length;
//       for (int i = 0; i < size; i++) {
//         final List<int> tmp = List.of(powerSet[i]);
//         tmp.add(num);
//         powerSet.add(tmp);
//       }
//     }
//     return powerSet;
//   }
// }