
void main() {
  print(Solution().combine(4, 2));  // [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
  print(Solution().combine(1, 1));  // [[1]]
}

class Solution {
  List<List<int>> combine(final int n, final int k) {
    final List<List<int>> powerSet = [];
    _subSets(1, n, k, [], powerSet);
    return powerSet;
  }

  void _subSets(final int index, final int n, final int k, final List<int> tmp, final List<List<int>> powerSet) {
    if (tmp.length == k) {
      powerSet.add(List.of(tmp));
      return;
    }

    for (int i = index; i <= n; i++) {
      tmp.add(i);
      _subSets(i+1, n, k, tmp, powerSet);
      tmp.removeLast();
    }
  }
}