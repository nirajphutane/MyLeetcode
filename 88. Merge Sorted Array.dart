
void main() {
  List<int> num1 = [1,2,3,0,0,0];
  Solution().merge(num1, 3, [2,5,6], 3);  // [1,2,2,3,5,6]
  print(num1);

  num1 = [2,5,6,0,0,0];
  Solution().merge(num1, 3, [1, 2, 3], 3);  // [1,2,2,3,5,6]
  print(num1);

  num1 = [1];
  Solution().merge(num1, 1, [], 0); // [1]
  print(num1);

  num1 = [0];
  Solution().merge(num1, 0, [1], 1);  // [1]
  print(num1);
}

class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {

    int i = nums1.length-1; // i = m+n-1
    while (n > 0 && m > 0) {
      if (nums1[m-1] >= nums2[n-1]) {
        nums1[i] = nums1[--m];
      } else {
        nums1[i] = nums2[--n];
      }
      i--;
    }

    while (n > 0) {
      nums1[i--] = nums2[--n];
    }
  }
}