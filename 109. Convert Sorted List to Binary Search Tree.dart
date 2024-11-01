
import 'dart:collection';

void main () {
  print(Solution().sortedListToBST(ListNode(-10, ListNode(-3, ListNode(0, ListNode(5, ListNode(9))))))?.toString()); // [0,-3,9,-10,null,5]
  print(Solution().sortedListToBST(null)?.toString()); // []
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() {
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

    return bfs.toString();
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() {
    String list = 'head -> ';
    ListNode? node = this;
    while (node != null) {
      list += '${node.val} -> ';
      node = node.next;
    }
    list += 'null';
    return list;
  }
}

class Solution {
  TreeNode? sortedListToBST(final ListNode? head) {

    if (head == null) {
      return null;
    }

    if (head.next == null) {
      return TreeNode(head.val);
    }

    ListNode slow = head;
    ListNode previous = slow;
    ListNode? fast = head;

    while (fast?.next != null) {
      fast = fast?.next?.next;
      previous = slow;
      slow = slow.next!;
    }

    previous.next = null;

    // print(head.toString());
    // print(slow.val.toString());
    // print(slow.next.toString());

    return TreeNode(slow.val, sortedListToBST(head), sortedListToBST(slow.next));
  }
}