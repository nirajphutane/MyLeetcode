
void main() {
  print(Solution().combine(4, 2));  // [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
  print(Solution().combine(1, 1));  // [[1]]
}

class Solution {
  List<List<int>> combine(final int n, final int k) {
    final List<List<int>> powerSet = [];
    _subsets(n, k, 1, powerSet, []);
    return powerSet;
  }

  void _subsets(final int n, final int k, final int index, final List<List<int>> powerSet, final List<int> tmp) {
    if (tmp.length == k) {
      powerSet.add(List.from(tmp));
      return;
    }

    for (int i = index; i <= n; i++) {
      tmp.add(i);
      _subsets(n, k, i+1, powerSet, tmp);
      tmp.removeLast();
    }
  }
}
