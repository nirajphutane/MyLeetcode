
void main() {
  print(Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)); // true
  print(Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13));// false
}

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    for (List<int> row in matrix) {
      final length = row.length-1;
      if (row[0] <= target && target <= row[length]) {
        int l = 0, h = length;
        while (l <= h) {
          final int m = (h+l) ~/ 2;
          if (target == m) {
            return true;
          } else if (target < m) {
            h = m-1;
          } else {
            l = m+1;
          }
        }
      }
    }
    return false;
  }
}

// class Solution {
//   bool searchMatrix(List<List<int>> matrix, int target) {
//     for (List<int> row in matrix) {
//       final length = row.length-1;
//       if (row[0] <= target && target <= row[length]) {
//         for (int i = 0; i <= length; i++) {
//           if (row[i] == target) {
//             return true;
//           }
//         }
//       }
//     }
//     return false;
//   }
// }