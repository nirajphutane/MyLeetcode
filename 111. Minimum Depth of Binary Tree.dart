
import 'dart:collection';

void main() {
  print(Solution().minDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // 2
  print(Solution().minDepth(TreeNode(2,  TreeNode(3,  TreeNode(4,  TreeNode(5,  TreeNode(6))))))); // 5
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {

  int minDepth(final TreeNode? root) {
    if (root == null) {
      return 0;
    }

    int depth = 1;

    final Queue<TreeNode?> queue = Queue();

    queue.add(root);
    queue.add(null);

    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        if (queue.isEmpty) {
          break;
        }
        queue.add(null);
        depth++;
      } else {
        if (node.left == null && node.right == null) {
          break;
        }

        if (node.left != null) {
          queue.add(node.left);
        }

        if (node.right != null) {
          queue.add(node.right);
        }
      }
    }

    return depth;
  }
}

/*
* Checking depth of first Root to Leaf path and then checking other paths until first one's depth.
* Suppose first Root to Leaf path is depth is 7 then other paths are looking until 7 if the depth more than that.
* But problem is, if first path is high than other(s) then this algo loose the performance.
* So in that kind of problem bfs is more suitable than dfs.
*/

// class Solution {
//
//   int minDepth(final TreeNode? root) => _minDepth(root, 0);
//   int? mini;
//   int _minDepth(final TreeNode? root, int minimum) {
//     if (root == null) {
//       return mini?? 0;
//     }
//     minimum++;
//     if (root.left == null && root.right == null) {
//       if (mini == null) {
//         mini = minimum;
//       } else if (minimum < mini!) {
//         return minimum;
//       }
//     }
//
//     minimum = _minDepth(root.left, minimum);
//     minimum = _minDepth(root.right, minimum);
//
//     return minimum;
//   }
// }