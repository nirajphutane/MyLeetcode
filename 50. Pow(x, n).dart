
void main() {
  print(Solution().myPow(2.00000, 10));  // 1024.00000
  print(Solution().myPow(2.10000, 3));  // 9.26100
  print(Solution().myPow(2.00000, -2));  // 0.25000
}

class Solution {
  double myPow(final double x, final int n) => n.isNegative? 1 / _myPow(x, n.abs()): _myPow(x, n);

  double _myPow(final double x, final int n) {
    if (x == 0) {
      return 0;
    }

    if (n == 1) {
      return x;
    }

    if (n.isEven) {
      return _myPow(x * x, n ~/2);
    } else {
      return _myPow(x * x, n ~/2) * x;
    }
  }
}

// class Solution {
//   double myPow(final double x, final int n) {
//     if (n < 0) {
//       return 1 / _power(x, n * -1);
//     } else {
//       return _power(x, n);
//     }
//   }
//
//   double _power(final double x, final int n) {
//     if (x == 0) {
//       return 0;
//     }
//
//     if (n == 0) {
//       return 1;
//     }
//
//     if (n.isEven) {
//       return myPow(x * x, n ~/ 2);
//     } else {
//       return x * myPow(x * x, n ~/ 2);
//     }
//   }
// }