
void main() {
  print(Solution().isPowerOfTwo(1));  // true
  print(Solution().isPowerOfTwo(16)); // true
  print(Solution().isPowerOfTwo(3));  // false
}

class Solution {
  bool isPowerOfTwo(int n) {
    if (n == 0) {
      return false;
    }

    while (n > 1) {
      if (n % 2 != 0) {
        return false;
      }
      n = n ~/ 2;
    }
    return true;
  }
}
