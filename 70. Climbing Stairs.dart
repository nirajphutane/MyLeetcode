
void main() {
  print(Solution().climbStairs(2));   // 2
  print(Solution().climbStairs(3));   // 3
  print(Solution().climbStairs(4));   // 5
  print(Solution().climbStairs(5));   // 8
}

class Solution {

  final Map<int, int> memo = {};
  int climbStairs(int n) {
    if (memo.containsKey(n)) {
      return memo[n]!;
    }

    if (n <= 1) {
      return 1;
    }

    memo[n] = climbStairs(n-1) + climbStairs(n-2);
    return memo[n]!;
  }
}

// class Solution {
//
//   int climbStairs(int n) {
//     int step1 = 0, step2 = 1;
//     for (int i = step2; i <= n; i++) {
//       final int total = step1 + step2;  // 1, 2, 3, 5, 8
//       step1 = step2;                    // 1, 1, 2, 3, 5
//       step2 = total;                    // 1, 2, 3, 5, 8
//     }
//     return step2;
//   }
// }