
void main () {
  final BSTIterator bstIterator = BSTIterator(TreeNode(7, TreeNode(3), TreeNode(15, TreeNode(9), TreeNode(20))));
  print(bstIterator.next());    // 3
  print(bstIterator.next());    // 7
  print(bstIterator.hasNext()); // true
  print(bstIterator.next());    // 9
  print(bstIterator.hasNext()); // true
  print(bstIterator.next());    // 15
  print(bstIterator.hasNext()); // true
  print(bstIterator.next());    // 20
  print(bstIterator.hasNext()); // false
}


class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class BSTIterator {

  final List<TreeNode> _stack = [];

  BSTIterator (final TreeNode? root) {
    _pushAll(root);
  }

  int next() {
    final TreeNode node = _stack.removeLast();
    _pushAll(node.right);
    return node.val;
  }

  bool hasNext() => _stack.isNotEmpty;

  void _pushAll (TreeNode? root) {
    while (root != null) {
      _stack.add(root);
      root = root.left;
    }
  }
}
