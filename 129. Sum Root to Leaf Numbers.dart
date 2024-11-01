
void main() {
  print(Solution().sumNumbers(TreeNode(1, TreeNode(2), TreeNode(3))));  // 25
  print(Solution().sumNumbers(TreeNode(4, TreeNode(9, TreeNode(5), TreeNode(1)), TreeNode(0))));  // 1026
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {

  int sumNumbers(TreeNode? root) => _sumNumbers(root, 0, 0);

  int _sumNumbers(final TreeNode? root, int number, int sum) {
    if (root == null) {
      return sum;
    }

    number = (number * 10) + root.val;
    if (root.left == null && root.right == null) {
      sum += number;
      number = 0;
    }

    sum = _sumNumbers(root.left, number, sum);
    sum = _sumNumbers(root.right, number, sum);

    return sum;
  }
}