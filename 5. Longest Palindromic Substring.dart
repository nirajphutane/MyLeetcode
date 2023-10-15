

void main(){
  String s = 'abccba';

  print(Solution().longestPalindrome(s));
}

class Solution {
  String longestPalindrome(String s) {

    String palindrome = '';
    List<List<bool>> table = List.generate(s.length, (index) => List.generate(s.length, (index) => false));

    for(int row = 0; row < s.length; row++) {
      for(int column = 0, hypotenuse = column; hypotenuse < s.length; column++, hypotenuse++) {

        if(row == 0) {
          table[column][hypotenuse] = true;
        } else if(row == 1){
          table[column][hypotenuse] = s[column] == s[hypotenuse];
        } else {
          if(table[column+1][hypotenuse-1] && s[column] == s[hypotenuse]) {
            table[column][hypotenuse] = true;
          }
        }

        if(table[column][hypotenuse]) {
          palindrome = s.substring(column, hypotenuse+1);
        }
      }
    }
    return palindrome;
  }
}
