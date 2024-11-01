void main() {
  print(Solution().getPermutation(3, 3)); //  213
  print(Solution().getPermutation(4, 9)); //  2314
  print(Solution().getPermutation(3, 1)); //  123
}

//1. 123
//2. 132
//3. 213
//4. 231
//5. 312
//6. 321

class Solution {
  String getPermutation(int n, int k) {

    k--;
    int factorial = 1;
    final List<String> numbers = List.generate(n-1, (index) {
      factorial *= index+1;
      return '${index+1}';
    });
    numbers.add('$n');

    String number = '';
    while(true) {

      final int position = (k ~/ factorial);
      number += numbers[position];
      numbers.removeAt(position);
      if (numbers.isEmpty) {
        break;
      }

      k %= factorial;
      factorial ~/= numbers.length;
    }

    return number;
  }
}