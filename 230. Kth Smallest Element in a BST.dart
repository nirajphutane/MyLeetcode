
void main() {
  print(Solution().kthSmallest(TreeNode(3, TreeNode(1, null, TreeNode(2)), TreeNode(4)), 1)); // 1
  print(Solution().kthSmallest(TreeNode(5, TreeNode(3, TreeNode(2, TreeNode(1)), TreeNode(4)), TreeNode(6)), 3)); // 3
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {

  final List<TreeNode> _stack = [];

  int kthSmallest(TreeNode? root, int k) {
    _push(root);
    while (_stack.isNotEmpty) {
      k--;
      if (k == 0) {
        break;
      }
      _push(_stack.removeLast().right);
    }
    return _stack.last.val;
  }

  void _push(TreeNode? root) {
    while (root != null) {
      _stack.add(root);
      root = root.left;
    }
  }
}
