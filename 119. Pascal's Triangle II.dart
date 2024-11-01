
void main() {
  print(Solution().generate(3));  // [1,3,3,1]
  print(Solution().generate(0));  // [1]
  print(Solution().generate(1));  // [1, 1]
}

class Solution {

  List<int> generate(final int numRows) {
    List<int> rows = [1];
    for (int row = 1; row <= numRows; row++) {
      final List<int> columns = List.generate(row+1, (index) => 0);
      for (int column = 0; column < row; column++) {
        columns[column] += rows[column];
        columns[column+1] += rows[column];
      }
      rows = columns;
    }
    return rows;
  }

  // List<int> generate(final int numRows) {
  //   final List<List<int>> lists = [];
  //
  //   for (int row = 0; row <= numRows; row++) {
  //     final List<int> list = [];
  //     for (int column = 0; column <= row; column++) {
  //       if (column == 0 || column == row) {
  //         list.add(1);
  //       } else {
  //         list.add(lists[row-1][column-1] + lists[row-1][column]);
  //       }
  //     }
  //     lists.add(List.from(list));
  //   }
  //
  //   return lists.last;
  // }
}