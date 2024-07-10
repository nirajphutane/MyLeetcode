
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
  int minDistance(final String str1, final String str2) {

    final int length1 = str1.length;
    final int length2 = str2.length;

    final List<List<int>> dp = List.generate(length1+1, (index) => List.generate(length2+1, (index) => 0));
    for (int r = 0; r <= length1; r++) {
      for (int c = 0; c <= length2; c++) {
        if (r == 0) {
          dp[0][c] = c;
        } else if (c == 0) {
          dp[r][0] = r;
        } else {
          if (str1[r-1] == str2[c-1]) {
            dp[r][c] = dp[r-1][c-1];
          } else {
            dp[r][c] = 1 + [dp[r-1][c-1], dp[r-1][c], dp[r][c-1]].reduce(min);
          }
        }
      }
    }

    return dp[length1][length2];
  }
}

// class Solution {
//
//   int minDistance(String word1, String word2) {
//     final List<List<int>> memo = List.generate(
//         word1.length+1, (index) => List.generate(word2.length+1, (index) => -1)
//     );
//     return findMinDistance(word1, word2, word1.length, word2.length, memo);
//   }
//
//   int findMinDistance(final String word1, final String word2, final int i, final int j, final List<List<int>> memo) {
//     if (i == 0) {
//       return j;
//     }
//
//     if (j == 0) {
//       return i;
//     }
//
//     if (memo[i][j] != -1) {
//       return memo[i][j];
//     }
//
//     if (word1[i-1] == word2[j-1]) {
//       memo[i][j] = findMinDistance(word1, word2, i-1, j-1, memo);
//     } else {
//       final int insert = findMinDistance(word1, word2, i-1, j, memo);
//       final int delete = findMinDistance(word1, word2, i, j-1, memo);
//       final int replace = findMinDistance(word1, word2, i-1, j-1, memo);
//       memo[i][j] = 1 +  [insert, delete, replace].reduce(min);
//     }
//     return memo[i][j];
//   }
// }