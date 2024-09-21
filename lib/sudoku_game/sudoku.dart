class Sudoku {
  final List<List<int?>> board;

  Sudoku() : board = List.generate(3, (_) => List.generate(3, (_) => null));

  bool isValid(int row, int col, int? value) {
    for (int i = 0; i < 3; i++) {
      if (board[row][i] == value || board[i][col] == value) {
        return false;
      }
    }
    return true;
  }

  bool setCell(int row, int col, int? value) {
    if (isValid(row, col, value)) {
      board[row][col] = value;
      return true;
    }
    return false;
  }
}
