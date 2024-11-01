
void main() {
  print(Solution().hasPathSum(TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))), TreeNode(8, TreeNode(13), TreeNode(4, null, TreeNode(1)))), 22)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 5)); // false
  print(Solution().hasPathSum(null, 0)); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}


class Solution {

  // bool hasPathSum(final TreeNode? root, int targetSum) => _hasPathSum(root, targetSum, 0);
  //
  // bool _hasPathSum(final TreeNode? root, final int targetSum, int sum) {
  //   if (root == null) {
  //     return false;
  //   }
  //
  //   sum += root.val;
  //   if (root.left == null && root.right == null) {
  //     if (sum == targetSum) {
  //       return true;
  //     }
  //   }
  //
  //   return _hasPathSum(root.left, targetSum, sum) || _hasPathSum(root.right, targetSum, sum);
  // }

  bool hasPathSum(final TreeNode? root, int targetSum) {
    if (root == null) {
      return false;
    }

    targetSum -= root.val;
    if (root.left == null && root.right == null) {
      if (targetSum == 0) {
        return true;
      }
    }

    return hasPathSum(root.left, targetSum) ||  hasPathSum(root.right, targetSum);
  }
}