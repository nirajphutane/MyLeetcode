
void main() {
  print(Solution().solveNQueens(4));  // [['.Q..','...Q','Q...','..Q.'],['..Q.','Q...','...Q','.Q..']]
  print(Solution().solveNQueens(1));  // [['Q']]
}

class Solution {
  List<List<String>> solveNQueens(final int n) {

    final List<List<String>> board = List.generate(n, (index) => List.generate(n, (index) => '.'));
    final List<List<String>> boards = [];

    _dfs(board, 0, boards);

    return boards;
  }

  void _dfs(final List<List<String>> board, final int column, final List<List<String>> boards) {

    if (column == board.length) {
      final List<String> finalBoard = [];
      for (List<String> row in board) {
        finalBoard.add("'${row.join('')}'");
      }
      boards.add(finalBoard);
      return;
    }

    for (int row = 0; row < board.length; row++) {
      if (_isSafe(board, row, column)) {
        board[row][column] = 'Q';
        _dfs(board, column+1, boards);
        board[row][column] = '.';
      }
    }
  }

  bool _isSafe(final List<List<String>> board, final int row, final int column) {
    for (int r = 0; r < board.length; r++) {
      if (board[r][column] == 'Q') {
        return false;
      }
    }

    for (int c = 0; c < board.length; c++) {
      if (board[row][c] == 'Q') {
        return false;
      }
    }

    for (int r = row, c = column; (r < board.length && c < board.length); r++, c++) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }

    for (int r = row, c = column; (r >= 0 && c >= 0); r--, c--) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }

    for (int r = row, c = column; (r >= 0 && c < board.length); r--, c++) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }

    for (int r = row, c = column; (r < board.length && c >= 0); r++, c--) {
      if (board[r][c] == 'Q') {
        return false;
      }
    }

    return true;
  }
}