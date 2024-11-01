
void main() {
  print(Solution().deleteDuplicates(ListNode(1, ListNode(1, ListNode(1)))).toString()); // head --> 1 --> 2 --> null
  print(Solution().deleteDuplicates(ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3)))))).toString()); // head --> 1 --> 2 --> 3 --> null
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
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode? current = head;
    while (current != null) {
      if (current.val == current.next?.val) {
        current.next = current.next?.next;
      } else {
        current = current.next;
      }
    }
    return head;
  }
}