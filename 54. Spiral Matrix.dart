
void main() {
  print(Solution().spiralOrder([[1,2],[3,4]])); // [1,2,4,3]
  print(Solution().spiralOrder([[1,2],[3,4],[5,6]])); // [1,2,4,6,5,3]
  print(Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])); // [1,2,3,6,9,8,7,4,5]
  print(Solution().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])); // [1,2,3,4,8,12,11,10,9,5,6,7]
}

//    L   R
// T  1 2 3
//     4 5 6
// B  7,8,9

class Solution {
  List<int> spiralOrder(final List<List<int>> matrix) {

    final List<int> spiral = [];

    int top = 0, bottom = matrix.length, left = 0, right = matrix[0].length;
    while ((top < bottom) && (left < right)) {

      for (int i = left; i < right; i++) {
        spiral.add(matrix[top][i]);
      }
      top++;

      for (int i = top; i < bottom; i++) {
        spiral.add(matrix[i][right-1]);
      }
      right--;

      for (int i = right-1; top < bottom && i >= left; i--) {
        spiral.add(matrix[bottom-1][i]);
      }
      bottom--;

      for (int i = bottom-1; left < right && i >= top; i--) {
        spiral.add(matrix[i][left]);
      }
      left++;

    }

    return spiral;
  }
}