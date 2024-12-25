
void main() {
  print(Solution().findMedianSortedArrays([1,3], [2]));   // 1
  print(Solution().findMedianSortedArrays([1,2], [3,4])); // 2.5
  print(Solution().findMedianSortedArrays([1], []));  // 0.5
  print(Solution().findMedianSortedArrays([], [1, 2]));  // 1.5
  print(Solution().findMedianSortedArrays([], [1, 2, 3]));  // 1
}

class Solution {
  double findMedianSortedArrays(final List<int> nums1, final List<int> nums2) {
    final List<int> sortedList = [];

    final int length = nums1.length + nums2.length;
    int i = 0, j = 0, midPoint = (length) ~/ 2;
    while (midPoint >= 0) {
      if (i < nums1.length && j < nums2.length) {
        if (nums1[i] < nums2[j]) {
          sortedList.add(nums1[i++]);
        } else {
          sortedList.add(nums2[j++]);
        }
      } else if (i < nums1.length) {
        sortedList.add(nums1[i++]);
      } else {
        sortedList.add(nums2[j++]);
      }
      midPoint--;
    }

    if (length.isEven) {
      return (sortedList[sortedList.length-1] + sortedList[sortedList.length-2]) / 2;
    }
    return sortedList.last / 2;
  }
}

// class Solution {
//   double findMedianSortedArrays(final List<int> nums1, final List<int> nums2) {
//
//     final int totalLength = nums1.length + nums2.length;
//     final int mid = (totalLength) ~/ 2;
//
//     final List<int> sortedList = [];
//     int i = 0, i1 = 0, i2 = 0;
//     while (i <= mid && i1 < nums1.length && i2 < nums2.length) {
//       if (nums1[i1] < nums2[i2]) {
//         sortedList.add(nums1[i1]);
//         i1++;
//       } else {
//         sortedList.add(nums2[i2]);
//         i2++;
//       }
//       i++;
//     }
//
//     while (i <= mid && i1 < nums1.length) {
//       sortedList.add(nums1[i1]);
//       i1++;
//       i++;
//     }
//
//     while (i <= mid && i2 < nums2.length) {
//       sortedList.add(nums2[i2]);
//       i2++;
//       i++;
//     }
//
//     if (totalLength.isEven) {
//       final int last = sortedList.length-1;
//       return (sortedList[last] + sortedList[last-1]) / 2;
//     }
//
//     return sortedList.last / 2;
//   }
// }