
void main() {
  print(Solution().generateMatrix(3)); // [[1,2,3],[8,9,4],[7,6,5]]
  print(Solution().generateMatrix(1)); // [[1]]
}

class Solution {
  List<List<int>> generateMatrix(final int size) {

    final List<List<int>> matrix = List.generate(size, (index) => List.generate(size, (index) => 0));

    int n = 1, top = 0, bottom = size-1, left = 0, right = size-1;
    while (top < bottom && left < right) {

      for (int i = left; i < right; i++) {
        matrix[top][i] = n++;
      }
      top++;

      for (int i = top; i < bottom; i++) {
        matrix[i][right-1] = n++;
      }
      right--;

      for (int i = right-1; i >= left; i--) {
        matrix[bottom-1][i] = n++;
      }
      bottom--;

      for (int i = bottom-1; i >= top; i--) {
        matrix[i][left] = n++;
      }
      left++;
    }

    return matrix;
  }
}