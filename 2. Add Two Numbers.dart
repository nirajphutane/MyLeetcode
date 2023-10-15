void main(){

  ListNode listNode1 = ListNode(2, ListNode(4, ListNode(3)));
  ListNode listNode2 = ListNode(5, ListNode(6, ListNode(4)));
  ListNode? listNode = Solution().addTwoNumbers(listNode1, listNode2);

  print('Result:');
  while(listNode != null){
    print(listNode.val);
    listNode = listNode.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {

    ListNode listNode = ListNode();
    ListNode head = listNode;
    int sum = 0, carry = 0;
    while(l1 != null || l2 != null) {   // OR: F || F = F else T
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