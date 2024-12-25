
void main() {
  print(Solution().longestCommonPrefix(['flower','flow','flight']));  // fl
  print(Solution().longestCommonPrefix(['dog','racecar','car'])); // ''
  print(Solution().longestCommonPrefix(['geeksforgeeks', 'geeks', 'geek', 'geezer']));  // gee
  print(Solution().longestCommonPrefix(['abc','a','abcd']));  // a
}

class Solution {
  String longestCommonPrefix(final List<String> strs) {
    String substring = '';
    final String first = strs.first;
    for (int i = 1; i < strs.length; i++) {
      int j = 0;
      while (j < first.length && j < strs[i].length) {
        if (strs[i][j] != first[j]) {
          break;
        }
        j++;
      }
      substring = first.substring(0, j);
    }
    return substring;
  }
}

// class Solution {
//   String longestCommonPrefix(final List<String> strs) {
//     final String base = strs.first;
//     for (int i = 0; i < base.length; i++) {
//       for (int j = 1; j < strs.length; j++) {
//         final String word = strs[j];
//         if (i == word.length || base[i] != word[i]) {
//           return base.substring(0, i);
//         }
//       }
//     }
//     return '';
//   }
// }