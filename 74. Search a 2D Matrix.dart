
void main() {
  print(Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)); // true
  print(Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 20)); // true
  print(Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)); // false
}

class Solution {
  bool searchMatrix(final List<List<int>> matrix, final int target) {
    for (int i = 0; i < matrix.length; i++) {
      final int size = matrix[i].length-1;
      if (target >= matrix[i][0] && target <= matrix[i][size]) {
        int low = 0, high = size;
        while (low <= high) {
          final int mid = (low + high) ~/ 2;
          if (matrix[i][mid] == target) {
            return true;
          }
          if (matrix[i][mid] < target) {
            low = mid + 1;
          } else {
            high = mid - 1;
          }
        }
        break;
      }
    }
    return false;
  }
}