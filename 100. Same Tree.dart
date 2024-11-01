
void main() {
  print(Solution().isSameTree(TreeNode(1, TreeNode(2), TreeNode(3)), TreeNode(1, TreeNode(2), TreeNode(3)))); // true
  print(Solution().isSameTree(TreeNode(1, TreeNode(2)), TreeNode(1, null, TreeNode(2)))); // false
  print(Solution().isSameTree(TreeNode(1, TreeNode(2), TreeNode(1)), TreeNode(1, TreeNode(1), TreeNode(2)))); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {

    if (p == null && q == null) {
      return true;
    }

    if (p?.val == q?.val) {
      return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right);
    }

    return false;
  }
}