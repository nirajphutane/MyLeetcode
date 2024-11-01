
void main() {
  print(Solution().isValid('()')); // true
  print(Solution().isValid('()[]{}')); // true
  print(Solution().isValid('(]')); // false
}

class Solution {
  bool isValid(final String s) {
    final List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(' || s[i] == '{' || s[i] == '[') {
        stack.add(s[i]);
      } else {
        final String popped = stack.removeLast();
        if ((s[i] == ')' && popped != '(') || (s[i] == '}' && popped != '{') || (s[i] == ']' && popped != '[')) {
          return false;
        }
      }
    }
    return true;
  }
}