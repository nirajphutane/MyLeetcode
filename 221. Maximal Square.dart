
import 'dart:math';

void main () {
  print(Solution().maximalSquare([['1','0','1','0','0'],['1','0','1','1','1'],['1','1','1','1','1'],['1','0','0','1','0']])); // 4
  print(Solution().maximalSquare([['0','1'],['1','0']])); // 1
  print(Solution().maximalSquare([['0']])); // 0
  print(Solution().maximalSquare([['1', '1', '0'], ['1', '1', '1'], ['1', '1', '0']])); // 4
}

class Solution {
  int maximalSquare(final List<List<String>> matrix) {
    int maxSquares = 0;
    final List<List<int>> dp = List.generate(matrix.length, (index) => List.generate(matrix.first.length, (index) => 0));

    for (int row = 0; row < matrix.length; row++) {
      for (int column = 0; column < matrix.first.length; column++) {

        if (row == 0 || column == 0) {
          dp[row][column] = int.parse(matrix[row][column]);
        } else {
          if (matrix[row][column] == '1') {
            dp[row][column] = [dp[row-1][column], dp[row][column-1], dp[row-1][column-1]].reduce(min) + 1;
          }
        }

        maxSquares = max(maxSquares, dp[row][column]);
      }
    }

    return maxSquares * maxSquares;
  }
}
