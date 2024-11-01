
void main() {
  print(Solution().pathSum(TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))), TreeNode(8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1)))), 22)); // [[5,4,11,2],[5,8,4,5]]
  print(Solution().pathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 5)); // []
  print(Solution().pathSum(null, 0)); // []
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> pathSum(TreeNode? root, int targetSum) {
    final List<List<int>> paths = [];
    _pathSum(root, targetSum, 0, [], paths);
    return paths;
  }

  void _pathSum(final TreeNode? root, final int targetSum, int sum, final List<int> path, final List<List<int>> paths) {

    if (root == null) {
      return;
    }

    sum += root.val;
    path.add(root.val);
    if (root.left == null && root.right == null) {
      if (sum == targetSum) {
        paths.add(List.from(path));
      }
    }

    _pathSum(root.left, targetSum, sum, path, paths);
    _pathSum(root.right, targetSum, sum, path, paths);

    path.removeLast();
  }
}

// class Solution {
//
//   List<List<int>> pathSum(final TreeNode? root, final int targetSum) {
//     final List<List<int>> lists = [];
//     _pathSum(root, targetSum, [], lists);
//     return lists;
//   }
//
//   void _pathSum(final TreeNode? root, int targetSum, final List<int> list, final List<List<int>> lists) {
//     if (root == null) {
//       return;
//     }
//
//     list.add(root.val);
//     targetSum -= root.val;
//     if (root.left == null && root.right == null) {
//       if (targetSum == 0) {
//         lists.add(List.from(list));
//       }
//     }
//
//     _pathSum(root.left, targetSum, list, lists);
//     _pathSum(root.right, targetSum, list, lists);
//
//     list.removeLast();
//   }
// }
