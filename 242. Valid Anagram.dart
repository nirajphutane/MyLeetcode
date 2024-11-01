
void main() {
  print(Solution().isAnagram('anagram', 'nagaram')); // true
  print(Solution().isAnagram('rat', 'car')); // false
}

class Solution {
  bool isAnagram (final String s, final String t) {
    final Map<String, int> map = {};

    for (int i = 0; i < s.length; i++) {
      if (map.containsKey(s[i])) {
        map[s[i]] = map[s[i]]! + 1;
      } else {
        map[s[i]] = 1;
      }
    }

    for (int i = 0; i < t.length; i++) {
      if (map.containsKey(t[i])) {
        map[t[i]] = map[t[i]]! - 1;
        if (map[t[i]] == 0) {
          map.remove(t[i]);
        }
      } else {
        return false;
      }
    }

    return map.isEmpty;
  }
}

