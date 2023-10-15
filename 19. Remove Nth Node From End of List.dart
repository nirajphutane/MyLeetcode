
void main() {
  ListNode? listNode = ListNode(5, ListNode(4, ListNode(3, ListNode(2, ListNode(1)))));
  int n = 5;
  listNode = Solution().removeNthFromEnd(listNode, n);
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
  ListNode? removeNthFromEnd(ListNode? head, int n) {

    if(head?.next == null) {
      return null;
    } else {
      // 1. Calculate length of LinkedList
      ListNode? listNode = head;
      int length = 0;
      while(listNode != null) {
        length++;
        listNode = listNode.next;
      }

      // 2. Find position from star
      int position = length - n;

      // 3. Special case for first position
      if(n == length) {
        return head?.next;
      }

      // 4. Travers up to position
      int index = 1;
      listNode = head;
      while(index < position) {
        head = head?.next;
        index++;
      }

      //5. Delete it
      head?.next = head.next?.next;

      return listNode;
    }
  }
}