void main(){
  print(Solution().addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4)))).toString());  // [7,0,8]
  print(Solution().addTwoNumbers(ListNode(0), ListNode(0)).toString());  // [0]
  print(Solution().addTwoNumbers(ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))))), ListNode(9, ListNode(9, ListNode(9, ListNode(9))))).toString()); // [8,9,9,9,0,0,0,1]
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
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {

    ListNode listNode = ListNode();
    final ListNode head = listNode;
    int sum = 0, carry = 0;
    while(l1 != null || l2 != null) {
      sum = (l1?.val?? 0) + (l2?.val?? 0) + carry;
      carry = sum ~/ 10;
      sum = sum % 10;
      listNode.next = ListNode(sum);

      l1 = l1?.next;
      l2 = l2?.next;
      listNode = listNode.next!;
    }

    if(carry == 1) {
      listNode.next = ListNode(carry);
    }

    return head.next;
  }
}