
void main() {
  print(Solution().isSymmetric(TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3))))); // true
  print(Solution().isSymmetric(TreeNode(1, TreeNode(2, null, TreeNode(3)), TreeNode(2, null, TreeNode(3))))); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSymmetric(final TreeNode? root) => _isSymmetric(root?.left, root?.right);

  // bool _isSymmetric(final TreeNode? left, final TreeNode? right) {
  //   if (left == null && right == null) {
  //     return true;
  //   }
  //
  //   if (left == null || right == null) {
  //     return false;
  //   }
  //
  //   if (left.val == right.val) {
  //     return _isSymmetric(left.left, right.right) && _isSymmetric(left.right, right.left);
  //   }
  //
  //   return false;
  // }

  // bool _isSymmetric(final TreeNode? left, final TreeNode? right) {
  //   if (left == null && right == null) {
  //     return true;
  //   }
  //
  //   if (left?.val == right?.val) {
  //     return _isSymmetric(left?.left, right?.right) && _isSymmetric(left?.right, right?.left);
  //   }
  //
  //   return false;
  // }

  bool _isSymmetric(final TreeNode? left, final TreeNode? right) {
    if (left == null && right == null) {
      return true;
    }

    if (left?.val != right?.val) {
      return false;
    }

    return _isSymmetric(left?.left, right?.right) && _isSymmetric(left?.right, right?.left);
  }
}