
void main() {
  print(Solution().postorderTraversal(TreeNode(1, null, TreeNode(2, TreeNode(3)))));  // [3,2,1]
  print(Solution().postorderTraversal(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5, TreeNode(6), TreeNode(7))), TreeNode(3, null, TreeNode(8, TreeNode(9))))));  // [4,6,7,5,2,9,8,3,1]
  print(Solution().postorderTraversal(null));   // []
  print(Solution().postorderTraversal(TreeNode(1)));  // [1]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    final List<int> list = [];
    _postorderTraversal(root, list);
    return list;
  }

  void _postorderTraversal(final TreeNode? node, final List<int> list) {
    if (node == null) {
      return;
    }

    _postorderTraversal(node.left, list);
    _postorderTraversal(node.right, list);
    list.add(node.val);
  }
}