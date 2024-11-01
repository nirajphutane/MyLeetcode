import 'dart:math';

void main() {
  print(Solution().maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // 3
  print(Solution().maxDepth(TreeNode(1, null, TreeNode(2)))); // 2
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxDepth(final TreeNode? root) {
    if (root == null) {
      return 0;
    }

    return max(maxDepth(root.left), maxDepth( root.right)) + 1;
  }
}