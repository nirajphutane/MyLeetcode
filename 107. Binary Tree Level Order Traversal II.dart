
import 'dart:collection';

void main() {
  print(Solution().levelOrder(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // [[15,7],[9,20],[3]]
  print(Solution().levelOrder(TreeNode(1))); // [1]
  print(Solution().levelOrder(null)); // []
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrder(final TreeNode? root) {

    if (root == null) {
      return [];
    }

    final List<List<int>> bfs = [];

    final List<int> list = [];
    final Queue<TreeNode?> queue = Queue();
    queue.add(root);
    queue.add(null);

    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        bfs.insert(0, List.from(list));
        list.clear();
        if (queue.isEmpty) {
          break;
        }
        queue.add(null);
      } else {
        list.add(node.val);
        if (node.left != null) {
          queue.add(node.left);
        }
        if (node.right != null) {
          queue.add(node.right);
        }
      }
    }

    return bfs;
  }
}