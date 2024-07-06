
void main() {
  print(Solution().mySqrt(1));  // 1
  print(Solution().mySqrt(4));  // 2
  print(Solution().mySqrt(8));  // 2
  print(Solution().mySqrt(17)); // 4
}

class Solution {
  int mySqrt(final int x) {
    int sqrt = 1;
    int l = 0, r = x;
    while (l <= r) {
      final int m = (l + r) ~/ 2;
      final int square = m * m;
      if (square == x) {
        return m;
      } else if (square < x) {
        sqrt = m;
        l = m + 1;
      } else {
        r = m - 1;
      }
    }
    return sqrt;
  }
}

// class Solution {
//   int mySqrt(int x) {
//     for (int i = 2; i <= x; i++) {
//       if ((i * i) > x) {
//         return i-1;
//       }
//     }
//     return 1;
//   }
// }

// class Solution {
//   int mySqrt(int x) {
//     for (int i = x; i >= 1; i--) {
//       if ((i * i) <= x) {
//         return i;
//       }
//     }
//     return 1;
//   }
// }