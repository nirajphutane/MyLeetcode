void main() {
  print(Solution().isIsomorphic('egg', 'add'));     // true
  print(Solution().isIsomorphic('foo', 'bar'));     // false
  print(Solution().isIsomorphic('paper', 'title')); // true
  print(Solution().isIsomorphic('badc', 'kikp'));   // false
}

class Solution {
  bool isIsomorphic(final String s, final String t) {
    final Map<String, String> map = {};
    final Set<String> set = {};

    for (int i = 0; i < s.length; i++) {
      if ((map.containsKey(s[i]) && map[s[i]] != t[i]) || (!map.containsKey(s[i]) && set.contains(t[i]))) {
        return false;
      } else {
        map[s[i]] = t[i];
        set.add(t[i]);
      }
    }

    return true;
  }
}