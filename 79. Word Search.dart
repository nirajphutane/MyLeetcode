
void main() {
  print(Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], 'ABCCED'));   // true
  print(Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], 'SEE'));      // true
  print(Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], 'ABCB'));     // false
}

// ["A","B","C","E"]
// ["S","F","C","S"]
// ["A","D","E","E"]

class Solution {
  bool exist(final List<List<String>> board, final String word) {

    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (board[i][j] == word[0]) {
          if (_dfs(board, word, 0, i, j)) {
            return true;
          }
        }
      }
    }

    return false;
  }

  // Depth First Search Algorithm
  bool _dfs(final List<List<String>> board, final String word, final int index, final int i, final int j) {

    if (index == word.length) {
      return true;
    }

    if ((i < 0 || i >= board.length) || (j < 0 || j >= board[0].length)) {
      return false;
    }

    if (board[i][j] != word[index]) {
      return false;
    }

    final String cache = board[i][j];
    board[i][j] = '-';

    final bool didFind = (
        _dfs(board, word, index+1, i, j-1) ||
        _dfs(board, word, index+1, i, j+1) ||
        _dfs(board, word, index+1, i-1, j) ||
        _dfs(board, word, index+1, i+1, j)
    );

    board[i][j] = cache;

    return didFind;
  }
}