void main() {
  ListNode? listNode = ListNode(1, ListNode(2, ListNode(3, ListNode(4))));
  listNode = Solution().swapPairs(listNode); // 2,1,4,3
  while(listNode != null) {
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
  ListNode? swapPairs(ListNode? head) {

    ListNode dummy = ListNode(0, head);
    ListNode? current = dummy;

    while(current?.next != null && current?.next?.next != null) {
      ListNode? first = current?.next;
      ListNode? second = first?.next;

      first?.next = second?.next;
      second?.next = first;
      current?.next = second;

      current = current?.next?.next;
    }

    return dummy.next;
  }
}