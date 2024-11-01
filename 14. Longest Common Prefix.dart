
void main() {
  print(Solution().longestCommonPrefix(['flower','flow','flight']));  // fl
  print(Solution().longestCommonPrefix(['dog','racecar','car'])); // ''
  print(Solution().longestCommonPrefix(['geeksforgeeks', 'geeks', 'geek', 'geezer']));  // gee
  print(Solution().longestCommonPrefix(['abc','a','abcd']));  // a
}

class Solution {
  String longestCommonPrefix(final List<String> strs) {
    final String base = strs.first;
    for (int i = 0; i < base.length; i++) {
      for (int j = 1; j < strs.length; j++) {
        final String word = strs[j];
        if (i == word.length || base[i] != word[i]) {
          return base.substring(0, i);
        }
      }
    }
    return '';
  }
}