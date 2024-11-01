
void main() {
  print(Solution().mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4)))).toString()); //  1 -> 1 -> 2 -> 3 -> 4 -> 4
  print(Solution().mergeTwoLists(null, null).toString()); // null
  print(Solution().mergeTwoLists(ListNode(0), null).toString());  // 0
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
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {

    ListNode listNode = ListNode();
    final ListNode head = listNode;
    while (list1 != null && list2 != null) {
      if (list1.val < list2.val) {
        listNode.next = ListNode(list1.val);
        listNode = listNode.next!;
        list1 = list1.next;
      } else {
        listNode.next = ListNode(list2.val);
        listNode = listNode.next!;
        list2 = list2.next;
      }
    }

    while (list1 != null) {
      listNode.next = ListNode(list1.val);
      listNode = listNode.next!;
      list1 = list1.next;
    }

    while (list2 != null) {
      listNode.next = ListNode(list2.val);
      listNode = listNode.next!;
      list2 = list2.next;
    }

    return head.next;
  }
}