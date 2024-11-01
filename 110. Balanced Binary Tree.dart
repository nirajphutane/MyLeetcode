
import 'dart:collection';
import 'dart:math';

void main () {
  print(Solution().isBalanced(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))));  // true
  print(Solution().isBalanced(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)), TreeNode(2))));  // false
}

extension on TreeNode {

  List<List<int>> bfs() {
    final List<List<int>> bfs = [];

    final List<int?> list = [];
    final Queue<TreeNode?> queue = Queue();
    queue.add(this);
    queue.add(null);

    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        bfs.add(List.from(list));
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

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isBalanced (final TreeNode? root) => _isBalanced(root).isBalanced;

  Data _isBalanced (final TreeNode? root) {
    if (root == null) {
      return Data(true, 0);
    }

    final Data left = _isBalanced(root.left);
    final Data right = _isBalanced(root.right);

    if (left.isBalanced && right.isBalanced) {
      if ((left.height - right.height).abs() <= 1) {
        return Data(true, max(left.height, right.height) + 1);
      }
    }

    return Data(false, 0);
  }
}

class Data {
  final bool isBalanced;
  final int height;

  const Data(this.isBalanced, this.height);
}