
void main() {
  print(Solution().generate(5));  // [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]
  print(Solution().generate(1));  // [[1]]
}

class Solution {
  List<List<int>> generate(final int numRows) {

    final List<List<int>> lists = [];

    for (int row = 0; row < numRows; row++) {
      final List<int> list = [];
      for (int column = 0; column <= row; column++) {
        if (column == 0 || column == row) {
          list.add(1);
        } else {
          list.add(lists[row-1][column-1] + lists[row-1][column]);
        }
      }
      lists.add(List.from(list));
    }

    return lists;
  }

  // List<List<int>> generate(final int numRows) {
  //
  //   final List<List<int>> lists = [];
  //   for (int row = 1; row <= numRows; row++) {
  //     final List<int> list = [];
  //     for (int column = 1; column <= row; column++) {
  //       if (column == 1 || column == row) {
  //         list.add(1);
  //       } else {
  //         list.add(lists[row-2][column-2] + lists[row-2][column-1]);
  //       }
  //     }
  //     lists.add(List.from(list));
  //   }
  //
  //   return lists;
  // }
}