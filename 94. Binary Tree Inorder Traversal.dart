
void main() {
  print(Solution().inorderTraversal(TreeNode(1, null, TreeNode(2, TreeNode(3)))));  // [1, 3, 2]
  print(Solution().inorderTraversal(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5, TreeNode(6), TreeNode(7))), TreeNode(3, null, TreeNode(8, TreeNode(9))))));  // [4,2,6,5,7,1,3,9,8]
  print(Solution().inorderTraversal(null));   // []
  print(Solution().inorderTraversal(TreeNode(1)));  // [1]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    final List<int> list = [];
    _inorderTraversal(root, list);
    return list;
  }

  void _inorderTraversal(final TreeNode? node, final List<int> list) {
    if (node == null) {
      return;
    }

    _inorderTraversal(node.left, list);
    list.add(node.val);
    _inorderTraversal(node.right, list);
  }
}