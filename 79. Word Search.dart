
void main() {
  print(Solution().exist([['A','B','C','E'],['S','F','C','S'],['A','D','E','E']], 'ABCCED')); // true
  print(Solution().exist([['A','B','C','E'],['S','F','C','S'],['A','D','E','E']], 'SEE'));    // true
  print(Solution().exist([['A','B','C','E'],['S','F','C','S'],['A','D','E','E']], 'ABCB'));   // false
}

class Solution {
  bool exist(final List<List<String>> board, final String word) {
    for (int row = 0; row < board.length; row++) {
      for (int column = 0; column < board[0].length; column++) {
        if (board[row][column] == word[0]) {
          if (_dfs(board, word, 0, row, column)) {
            return true;
          }
        }
      }
    }

    return false;
  }

  bool _dfs(final List<List<String>> board, final String word, final int index, final int row, final int column) {

    if (index == word.length) {
      return true;
    }

    if ((row < 0 || row >= board.length) || (column < 0 || column >= board[0].length)) {
      return false;
    }

    if (board[row][column] != word[index]) {
      return false;
    }

    final String cache = board[row][column];
    board[row][column] = '*';

    final bool didFind = (
        _dfs(board, word, index+1, row+1, column) ||
            _dfs(board, word, index+1, row-1, column) ||
            _dfs(board, word, index+1, row, column+1) ||
            _dfs(board, word, index+1, row, column-1)
    );

    board[row][column] = cache;
    return didFind;
  }
}