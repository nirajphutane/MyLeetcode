
void main() {
  for (int i = 0; i <= 5; i++) {
    print('$i: ${Solution().removeNthFromEnd(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), i)}');
  }
  print(Solution().removeNthFromEnd(ListNode(1), 1).toString());
  print(Solution().removeNthFromEnd(ListNode(1, ListNode(2)), 1).toString());
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
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    ListNode? headNode = head;

    int length = 0;
    while (headNode != null) {
      headNode = headNode.next;
      length++;
    }

    if (n == length) {
      return head?.next;
    }

    headNode = head;
    for (int i = 1; i < length-n; i++) {
      headNode = headNode?.next;
    }
    headNode?.next = headNode.next?.next;

    return head;
  }
}

// ListNode? removeNthFromEnd(ListNode? head, int n) {
//   ListNode? current = head;
//
//   int length = 0;
//   while (current != null) {
//     length++;
//     current = current.next;
//   }
//   length = length - n;
//
//   if (length == 0) {
//     return head?.next;
//   }
//
//   current = head;
//   int i = 0;
//   while (i < length-1) {
//     current = current?.next;
//     i++;
//   }
//   current?.next = current.next?.next;
//   return head;
// }