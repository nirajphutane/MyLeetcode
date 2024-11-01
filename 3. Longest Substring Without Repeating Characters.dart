
import 'dart:math';

void main() {
  print(Solution().lengthOfLongestSubstring('abcabcbb')); // 3
  print(Solution().lengthOfLongestSubstring('bbbbb'));  // 1
  print(Solution().lengthOfLongestSubstring('pwwkew')); // 3
}

class Solution {
  int lengthOfLongestSubstring(final String word) {
    int lengthOfLongestSubstring = 0;
    final Set<String> substring = {};
    for (int i = 0; i < word.length; i++) {
      if (substring.contains(word[i])) {
        lengthOfLongestSubstring = max(lengthOfLongestSubstring, substring.length);
        substring.clear();
      }
      substring.add(word[i]);
    }
    return lengthOfLongestSubstring;
  }
}