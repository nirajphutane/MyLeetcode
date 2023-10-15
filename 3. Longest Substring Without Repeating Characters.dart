import 'dart:math';

void main(){
  String s = 'abcabcbb';// 3
  // s = 'bbbbb';  // 1
  // s = 'pwwkew'; // 3

  print(Solution().lengthOfLongestSubstring(s));
}

class Solution {
  int lengthOfLongestSubstring(String s) {

    int length = 0;
    Set<String> set = {};
    int j = 0;
    for(int i = 0; i < s.length; i++) {
      if(set.contains(s[i])) {
        while(j < i){
          set.remove(s[j]);
          j++;
        }

        // while(set.contains(s[j])){
        //   set.remove(s[j]);
        //   j++;
        // }
      }
      set.add(s[i]);
      length = max(length, set.length);

      // length = max(length, i-j+1);
    }

    return length;
  }
}