
import 'dart:collection';

void main() {
  print(Solution().zigzagLevelOrder(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // [[3],[20,9],[15,7]]
  print(Solution().zigzagLevelOrder(TreeNode(1))); // [1]
  print(Solution().zigzagLevelOrder(null)); // []
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> zigzagLevelOrder(final TreeNode? root) {
    if (root == null) {
      return [];
    }

    final List<List<int>> bfs = [];

    bool isFromLeftToRight = true;
    final List<int> list = [];
    final Queue<TreeNode?> queue = Queue();
    queue.add(root);
    queue.add(null);

    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        bfs.add(List.from(list));
        list.clear();
        isFromLeftToRight = !isFromLeftToRight;
        if (queue.isEmpty) {
          break;
        }
        queue.add(null);
      } else {
        if (isFromLeftToRight) {
          list.add(node.val);
        } else {
          list.insert(0, node.val);
        }
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