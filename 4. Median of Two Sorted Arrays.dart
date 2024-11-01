
void main() {
  print(Solution().findMedianSortedArrays([1,3], [2]));   // 1
  print(Solution().findMedianSortedArrays([1,2], [3,4])); // 2.5
  print(Solution().findMedianSortedArrays([1], []));  // 0.5
  print(Solution().findMedianSortedArrays([], [1, 2]));  // 1.5
  print(Solution().findMedianSortedArrays([], [1, 2, 3]));  // 1
}

class Solution {
  double findMedianSortedArrays(final List<int> nums1, final List<int> nums2) {

    final int totalLength = nums1.length + nums2.length;
    final int mid = (totalLength) ~/ 2;

    final List<int> sortedList = [];
    int i = 0, i1 = 0, i2 = 0;
    while (i <= mid && i1 < nums1.length && i2 < nums2.length) {
      if (nums1[i1] < nums2[i2]) {
        sortedList.add(nums1[i1]);
        i1++;
      } else {
        sortedList.add(nums2[i2]);
        i2++;
      }
      i++;
    }

    while (i <= mid && i1 < nums1.length) {
      sortedList.add(nums1[i1]);
      i1++;
      i++;
    }

    while (i <= mid && i2 < nums2.length) {
      sortedList.add(nums2[i2]);
      i2++;
      i++;
    }

    if (totalLength.isEven) {
      final int last = sortedList.length-1;
      return (sortedList[last] + sortedList[last-1]) / 2;
    }

    return sortedList.last / 2;
  }
}