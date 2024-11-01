
void main() {
  print(Solution().mySqrt(4));  // 2
  print(Solution().mySqrt(8));  // 2
  print(Solution().mySqrt(9));  // 3
  print(Solution().mySqrt(24)); // 4
  print(Solution().mySqrt(25)); // 5
  print(Solution().mySqrt(26)); // 5
}

class Solution {
  int mySqrt(final int x) {
    int sqrt = 1, low = 0, high = x;
    while (low <= high) {
      final int mid = (low + high) ~/2;
      final int square = mid * mid;
      if (square == x) {
        sqrt = mid;
        break;
      } else {
        if (x > square) {
          sqrt = mid;
          low = mid + 1;
        } else {
          high = mid - 1;
        }
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