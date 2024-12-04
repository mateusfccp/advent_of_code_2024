/// An extension for a list of list representing a matrix.
extension MatrixExtension<T> on List<List<T>> {
  /// Returns the width of the matrix.
  int get width => this[0].length;

  /// Returns the height of the matrix.
  int get height => length;

  /// Gets the columns of the matrix.
  List<List<T>> getColumns() {
    final width = this[0].length;
    final height = length;

    return [
      for (int i = 0; i < width; i++) [for (int j = 0; j < height; j++) this[j][i]],
    ];
  }

  /// Gets the diagonals of the matrix, starting from the top-left corner.
  ///
  /// Example:
  /// ```dart
  /// [
  ///   [1, 2, 3],
  ///   [4, 5, 6],
  ///   [7, 8, 9],
  /// ].getDiagonalsNESW();
  /// ```
  ///
  /// Returns:
  /// ```dart
  /// [
  ///   [1],
  ///   [4, 2],
  ///   [7, 5, 3],
  ///   [8, 6],
  ///   [9],
  /// ]
  /// ```
  List<List<T>> getDiagonalsNESW() {
    final diagonals = List.generate(width + height - 1, (index) => <T>[]);

    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        diagonals[i + j].add(this[j][i]);
      }
    }

    return diagonals;
  }

  /// Returns how many times [submatrix] appears in the matrix.
  int countSubmatrix(
    List<List<T>> submatrix, {
    bool Function(T, T)? compare,
  }) {
    if (submatrix.width > width || submatrix.height > height) {
      return 0;
    }

    int count = 0;

    final lastColumn = width - submatrix.width;
    final lastRow = height - submatrix.height;

    for (int i = 0; i <= lastColumn; i++) {
      for (int j = 0; j <= lastRow; j++) {
        if (submatrix.isSubmatrixOf(
          this,
          i,
          j,
          compare: compare,
        )) {
          count++;
        }
      }
    }

    return count;
  }

  /// Returns whether [matrix] is a submatrix of the matrix.
  bool isSubmatrixOf(
    List<List<T>> matrix,
    int x,
    int y, {
    bool Function(T, T)? compare,
  }) {
    compare ??= (a, b) => a == b;

    if (matrix.width < width || matrix.height < height) {
      return false;
    }

    for (int i = x; i < x + width; i++) {
      for (int j = y; j < y + height; j++) {
        if (!compare(matrix[j][i], this[j - y][i - x])) {
          return false;
        }
      }
    }

    return true;
  }
}
