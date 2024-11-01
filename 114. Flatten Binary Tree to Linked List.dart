
import 'dart:collection';

void main () {
  TreeNode? node = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(5, null, TreeNode(6)));
  Solution().flatten(node); // [1,null,2,null,3,null,4,null,5,null,6]
  print(node.toString());

  node = null;
  Solution().flatten(node); // []
  print(node.toString());

  node = TreeNode(0);
  Solution().flatten(node); // [0]
  print(node.toString());
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() {
    final List<List<int>> bfs = [];

    final List<int> list = [];
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

    return bfs.toString();
  }
}

class Solution {

  TreeNode? previous;

  void flatten(final TreeNode? root) {
    if (root == null) {
      return;
    }

    flatten(root.right);
    flatten(root.left);

    root.right = previous;
    root.left = null;

    previous = root;
  }
}