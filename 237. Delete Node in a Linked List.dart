
void main() {
  ListNode toDelete = ListNode(5, ListNode(1, ListNode(9)));
  ListNode head = ListNode(4, toDelete);
  Solution().deleteNode(toDelete); // 4 -> 1-> 9
  print(head.toString());

  toDelete = ListNode(1, ListNode(9));
  head = ListNode(4, ListNode(5, toDelete));
  Solution().deleteNode(toDelete); // 4 -> 1-> 9
  print(head.toString());
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() {
    ListNode? head = this;
    String list = '';
    list += 'head --> ';
    while (head != null) {
      list += '${head.val} --> ';
      head = head.next;
    }
    list += 'null';
    return list;
  }
}

class Solution {

  void deleteNode(final ListNode node) {
    node.val = node.next!.val;
    node.next = node.next?.next;
  }
}