
import 'dart:collection';

void main() {
  print(Solution().buildTree([3,9,20,15,7], [9,3,15,20,7])!.bfs()); // [[3], [9, 20], [15, 7]]
  print(Solution().buildTree([-1], [-1])!.bfs()); // [-1]

  print(Solution().buildTree(
      [25, 15, 10, 4, 12, 22, 18, 24, 50, 35, 31, 44, 70, 66, 90],
      [4, 10, 12, 15, 18, 22, 24, 25, 31, 35, 44, 50, 66, 70, 90]
  )!.bfs()); // [[25], [15, 50], [10, 22, 35, 70], [4, 12, 18, 24, 31, 44, 66, 90]]
}

extension on TreeNode {
  List<List<int?>> bfs() {

    final List<List<int?>> bfs = [];

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

  TreeNode? buildTree(final List<int> preorder, final List<int> inorder) {
    final Map<int, int> inOrderMap = {};
    for (int i = 0; i < inorder.length; i++) {
      inOrderMap[inorder[i]] = i;
    }
    return _buildTree(preorder, 0, preorder.length-1, inorder, 0, inorder.length-1, inOrderMap);
  }

  TreeNode? _buildTree(final List<int> preorder, final int preStart, final int preEnd, final List<int> inorder, final int inStart, final int inEnd, final Map<int, int> inOrderMap) {
    if (preStart > preEnd || inStart > inEnd) {
      return null;
    }

    final int inRoot = inOrderMap[preorder[preStart]]!;
    final int preLeft = inRoot - inStart;
    return TreeNode(
        preorder[preStart],
        _buildTree(
            preorder, preStart+1, preStart+preLeft,
            inorder, inStart, inRoot-1,
            inOrderMap
        ),
        _buildTree(
            preorder, preStart+preLeft+1, preEnd,
            inorder, inRoot+1, inEnd,
            inOrderMap
        )
    );
  }
}