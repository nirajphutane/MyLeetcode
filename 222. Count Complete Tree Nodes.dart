
import 'dart:math';

void main() {
  print(Solution().countNodes(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6))))); // 6
  print(Solution().countNodes(null)); // 0
  print(Solution().countNodes(TreeNode(1)));  // 1
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {

  int countNodes(final TreeNode? root) {
    if (root == null) {
      return 0;
    }

    final int leftTreeHeight = _leftTreeHeight(root);
    final int rightTreeHeight = _rightTreeHeight(root);

    if (leftTreeHeight == rightTreeHeight) {
      return pow(2, leftTreeHeight).toInt() -1;
    }

    return countNodes(root.left) + countNodes(root.right) + 1;
  }

  int _leftTreeHeight(final TreeNode? root) {
    if (root == null) {
      return 0;
    }

    return _leftTreeHeight(root.left) + 1;
  }

  int _rightTreeHeight(final TreeNode? root) {
    if (root == null) {
      return 0;
    }

    return _rightTreeHeight(root.right) + 1;
  }
}
