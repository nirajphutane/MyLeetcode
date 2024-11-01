
import 'dart:math';

void main() {
  print(Solution().minDistance('horse', 'ros'));   // 3
  print(Solution().minDistance('intention', 'execution'));   // 5
}

//     r o s
//   0|1|2|3|
// h 1|1|2|3|
// o 2|2|1|2|
// r 3|2|2|2|
// s 4|3|3|2|
// e 5|4|4|3|

// Same -> carry forward corner element (here 2)
//      a
//    2|1|
//  a 3|0|

// Different -> take min(2, 5, 4) + 1 = 3
//      a
//    2|5|
//  b 4|3|

class Solution {
  int minDistance(final String word1, final String word2) {
    final List<List<int>> matrix = List.generate(word1.length, (index) => List.generate(word2.length, (index) => 0));
    for (int row = 0; row < word1.length; row++) {
      for (int column = 0; column < word2.length; column++) {
        if (row == 0) {
          matrix[row][column] = column;
        } else if (column == 0) {
          matrix[row][column] = row;
        } else {
          if (word1[row-1] == word2[column-1]) {
            matrix[row][column] = matrix[row-1][column-1];
          } else {
            matrix[row][column] = [matrix[row-1][column], matrix[row][column-1], matrix[row-1][column-1]].reduce(min) + 1;
          }
        }
      }
    }
    return matrix[word1.length-1][word2.length-1];
  }
}