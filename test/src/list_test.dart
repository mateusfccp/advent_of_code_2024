import 'package:advent_of_code_2024/src/list.dart';
import 'package:test/test.dart';

void main() {
  test("'MatrixExtension.getColumns' should get a transposed matrix.", () {
    expect(
      [
        [1, 2, 3],
        [4, 5, 6],
      ].getColumns(),
      [
        [1, 4],
        [2, 5],
        [3, 6],
      ],
    );

    expect(
      [
        [1, 2],
        [3, 4],
        [5, 6],
      ].getColumns(),
      [
        [1, 3, 5],
        [2, 4, 6],
      ],
    );
  });

  test(
    "'MatrixExtension.getDiagonalsNESW' should get the diagonals of a matrix starting from the top-left corner.",
    () {
      expect(
        [
          [1, 2, 3],
          [4, 5, 6],
        ].getDiagonalsNESW(),
        [
          [1],
          [4, 2],
          [5, 3],
          [6],
        ],
      );

      expect(
        [
          [1, 2],
          [3, 4],
          [5, 6],
        ].getDiagonalsNESW(),
        [
          [1],
          [3, 2],
          [5, 4],
          [6],
        ],
      );

      expect(
        [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]
        ].getDiagonalsNESW(),
        [
          [1],
          [4, 2],
          [7, 5, 3],
          [8, 6],
          [9],
        ],
      );
    },
  );

  test(
    "'MatrixExtension.countSubmatrix' should return how many occurences there are of a submatrix in another matrix",
    () {
      // expect(
      //   [
      //     [1, 1],
      //     [1, 1],
      //   ].countSubmatrix([
      //     [1],
      //   ]),
      //   4,
      // );

      expect(
        [
          [1, 1],
          [1, 1],
        ].countSubmatrix([
          [1, 1],
        ]),
        2,
      );

      expect(
        [
          [1, 1],
          [1, 1],
        ].countSubmatrix([
          [1],
          [1],
        ]),
        2,
      );

      expect(
        [
          [1, 1],
          [1, 1],
        ].countSubmatrix([
          [1, 1],
          [1, 1],
        ]),
        1,
      );
    },
  );

  test(
    "'MatrixExtension.isSubmatrixOf' should return whether a given matrix is a submatrix of another.",
    () {
      expect(
        [
          [1, 1],
        ].isSubmatrixOf(
          [
            [1, 1],
            [1, 1],
          ],
          0,
          1,
        ),
        true,
      );
      
      expect(
        [
          [1, 2],
          [4, 5],
        ].isSubmatrixOf(
          [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
          ],
          0,
          0,
        ),
        true,
      );

      expect(
        [
          [1, 2],
          [4, 5],
        ].isSubmatrixOf(
          [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
          ],
          1,
          1,
        ),
        false,
      );

      expect(
        [
          [1, 2],
          [4, 5],
        ].isSubmatrixOf(
          [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
          ],
          0,
          1,
        ),
        false,
      );

      expect(
        [
          [5, 6],
          [8, 9],
        ].isSubmatrixOf(
          [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
          ],
          1,
          1,
        ),
        true,
      );
    },
  );
}
