
void main(){
  String s = 'PAYPALISHIRING';
  int numRows = 3;

  // P   A   H   N
  // A P L S I I G
  // Y   I   R

  print(Solution().convert(s, numRows)); // PAHNAPLSIIGYIR
}

class Solution {
  String convert(String s, int rows) {

    String zigzag = '';

    final int pillar = (rows - 1) * 2;

    for(int row = 0; row < rows; row++) {

      for(int column = row; column < s.length; column += pillar) {

        zigzag += s[column];

        if(row > 0 && row < rows - 1) {

          // cpr = c+(p-2)r
          final int cross = column + (pillar - 2) * row;
          if(cross < s.length) {
            zigzag += s[cross];
          }

        }

      }

    }

    return zigzag;
  }
}