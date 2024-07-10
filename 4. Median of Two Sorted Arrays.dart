void main(){

  final List<int> nums1 = [1, 3, 5];
  final List<int> nums2 = [2, 4, 6];

  print(Solution().findMedianSortedArrays(nums1, nums2));
}

class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {

    double midPoint = (nums1.length + nums2.length).toDouble();

    if (midPoint == 0) {
      return -1;
    } else if (midPoint % 2 == 0) {
      midPoint = (midPoint / 2) + 1;
    } else {
      midPoint = (midPoint / 2).ceilToDouble();
    }

    final List<int> sorted = [];

    int i = 0, j = 0;
    while((i + j) < midPoint) {
      if (i < nums1.length || j < nums2.length) {
        if (i >= nums1.length) {
          sorted.add(nums2[j]);
          j++;
        } else if (j >= nums2.length) {
          sorted.add(nums1[i]);
          i++;
        } else {
          if (nums1[i] < nums2[j]) {
            sorted.add(nums1[i]);
            i++;
          } else {
            sorted.add(nums2[j]);
            j++;
          }
        }
      }
    }

    if (sorted.length != 1 && sorted.length.isOdd) {
      return (sorted.removeLast() + sorted.removeLast())/2;
    }
    return sorted.removeLast().toDouble();
  }
}

// class Solution {
//   double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
//
//     double mid = 0;
//     double element1 = -1, element2 = -1;
//     int mid2 = (nums1.length + nums2.length) ~/ 2;
//     int mid1 = mid2 - 1;
//
//     int i = 0, j = 0, count = 0;
//     while(i < nums1.length && j < nums2.length) {
//
//       if(nums1[i] < nums2[j]) {
//         if(mid1 == count) {
//           element1 = nums1[i].toDouble();
//         } else if(mid2 == count) {
//           element2 = nums1[i].toDouble();
//         }
//         i++;
//       } else {
//         if(mid1 == count) {
//           element1 = nums2[j].toDouble();
//         } else if(mid2 == count) {
//           element2 = nums2[j].toDouble();
//         }
//         j++;
//       }
//
//       mid = findMid(mid1, mid2, element1, element2);
//       if(mid != -1){
//         return mid;
//       }
//
//       count++;
//     }
//
//     while(i < nums1.length) {
//       if(mid1 == count) {
//         element1 = nums1[i].toDouble();
//       } else if(mid2 == count) {
//         element2 = nums1[i].toDouble();
//       }
//       i++;
//       count++;
//     }
//
//     while(j < nums2.length) {
//       if(mid1 == count) {
//         element1 = nums2[j].toDouble();
//       } else if(mid2 == count) {
//         element2 = nums2[j].toDouble();
//       }
//       j++;
//       count++;
//     }
//
//     return findMid(mid1, mid2, element1, element2);
//   }
//
//   double findMid(int mid1, int mid2, double element1, double element2) {
//     if(mid2 == 0 || mid2.isOdd) {
//       if(element2  != -1) {
//         return element2.toDouble();
//       }
//     } else {
//       if(element2  != -1 && element1 != -1) {
//         return (element1 + element2)/2;
//       }
//     }
//
//     return -1;
//   }
// }