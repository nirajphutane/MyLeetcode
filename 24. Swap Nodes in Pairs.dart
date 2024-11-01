
void main() {
  print(Solution().swapPairs(ListNode(1, ListNode(2, ListNode(3, ListNode(4))))).toString()); // head --> 2 --> 1 --> 4 --> 3 --> null
  print(Solution().swapPairs(null).toString()); // null
  print(Solution().swapPairs(ListNode(1)).toString());  // head --> 1 --> null
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
  ListNode? swapPairs(final ListNode? head) {

    final ListNode dummyNode = ListNode(0, head);
    ListNode? current = dummyNode;

    while (current?.next != null && current?.next?.next != null) {
      final ListNode? first = current?.next;
      final ListNode? second = first?.next;

      first?.next = second?.next;
      second?.next = first;
      current?.next = second;

      current = current?.next?.next;
    }

    return dummyNode.next;
  }
}