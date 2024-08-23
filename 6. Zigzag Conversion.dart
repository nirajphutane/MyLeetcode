
import 'dart:io';

void main() {
  // P   A   H   N
  // A P L S I I G
  // Y   I   R
  print('${Solution().convert('PAYPALISHIRING', 3)}\n'); // PAHNAPLSIIGYIR

  // P     I     N
  // A   L S   I G
  // Y A   H R
  // P     I
  print('${Solution().convert('PAYPALISHIRING', 4)}\n'); // PINALSIGYAHRPI

  // 3
  // A E I M Q U Y
  // BDFHJLNPRTVXZ
  // C G K O S W
  print('${Solution().convert('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 3)}\n'); // AEIMQUYBDFHJLNPRTVXZCGKOSW

  // 4
  // A  G  M  S  Y
  // B FH LN RT XZ
  // CE IK OQ UW
  // D  J  P  V
  print('${Solution().convert('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 4)}\n'); // AGMSYBFHLNRTXZCEIKOQUWDJPV

  // 5
  // A   I   Q   Y
  // B  HJ  PR  XZ
  // C G K O S W
  // DF  LN  TV
  // E   M   U
  print('${Solution().convert('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 5)}\n'); // AIQYBHJPRXZCGKOSWDFLNTVEMU
}

class Solution {
  String convert(final String word, final int rows) {

    if (rows == 1 || rows == word.length) {
      return word;
    }

    String zigzag = '';

    final int wordLength = word.length;
    final int rowDistance = rows + (rows - 2);
    final int columns = _getColumns(wordLength, rows);

    int rowDistanceOffset = 0;
    for (int r = 0; r < rows; r++) {
      int column = 0;
      for (int c = 0; c < columns; c++) {
        final int wordIndex = r + (rowDistance * column);
        final int crossWordIndex = wordIndex - rowDistanceOffset;
        final int columnIndex = (rows - 1) * column;

        if (wordIndex < wordLength && c == columnIndex) {
          zigzag += word[wordIndex];
          stdout.write(word[wordIndex]);
          column++;
        } else if ((r != 0 && r != rows-1) && (c == (columnIndex - r)) && (crossWordIndex < wordLength)) {
          zigzag += word[crossWordIndex];
          stdout.write(word[crossWordIndex]);
        } else {
          stdout.write(' ');
        }

      }
      rowDistanceOffset += 2;
      print('');
    }

    return zigzag;
  }

  int _getColumns(int wordLength, final int rows) {
    final int rowDistance = rows - 2;
    int columns = 0;
    while (wordLength > rows) {
      columns += 1;
      wordLength -= rows;
      if (wordLength < rowDistance) {
        columns += wordLength;
        return columns;
      }
      columns += rowDistance;
      wordLength -= rowDistance;
    }

    if (wordLength > 0) {
      columns++;
    }

    return columns;
  }
}

// class Solution {
//   String convert(String s, int rows) {
//
//     String zigzag = '';
//
//     final int pillar = (rows - 1) * 2;
//
//     for(int row = 0; row < rows; row++) {
//
//       for(int column = row; column < s.length; column += pillar) {
//
//         zigzag += s[column];
//
//         if(row > 0 && row < rows - 1) {
//
//           // cpr = c+(p-2)r
//           final int cross = column + (pillar - 2) * row;
//           if(cross < s.length) {
//             zigzag += s[cross];
//           }
//
//         }
//
//       }
//
//     }
//
//     return zigzag;
//   }
// }