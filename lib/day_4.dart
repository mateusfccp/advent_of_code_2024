import 'dart:convert';

import 'package:meta/meta.dart';

import 'src/list.dart';

final _pattern = 'XMAS'.codeUnits;

/// Solves the first puzzle of day 2.
int puzzle1(String input) {
  final parsedInput = [
    for (final line in LineSplitter.split(input)) line.codeUnits,
  ];
  final horizontal = _countHorizontally(parsedInput);
  final vertical = _countVertically(parsedInput);
  final diagonal = _countDiagonally(parsedInput);

  return horizontal + vertical + diagonal;
}

final any = RegExp('.');

final _matches = [
  [
    ['M', any, 'M'],
    [any, 'A', any],
    ['S', any, 'S'],
  ],
  [
    ['M', any, 'S'],
    [any, 'A', any],
    ['M', any, 'S'],
  ],
  [
    ['S', any, 'S'],
    [any, 'A', any],
    ['M', any, 'M'],
  ],
  [
    ['S', any, 'M'],
    [any, 'A', any],
    ['S', any, 'M'],
  ],
];

/// Solves the first puzzle of day 2.
int puzzle2(String input) {
  final parsedInput = [
    for (final line in LineSplitter.split(input)) line.split(''),
  ] as List<List<Pattern>>;

  int count = 0;

  for (final match in _matches) {
    count += parsedInput.countSubmatrix(match, compare: (a, b) {
      return b.allMatches(a as String).length == 1;
    });
  }

  return count;
}

int _countHorizontally(List<List<int>> input) {
  int count = 0;

  for (final line in input) {
    count += countMatches(line, _pattern);
    count += countMatches([...line.reversed], _pattern);
  }

  return count;
}

int _countVertically(List<List<int>> input) {
  final verticalInput = input.getColumns();

  int count = 0;

  for (final line in verticalInput) {
    count += countMatches(line, _pattern);
    count += countMatches([...line.reversed], _pattern);
  }

  return count;
}

int _countDiagonally(List<List<int>> input) {
  final diagonalInput = input.getDiagonalsNESW();
  final otherDiagonalInput = [...input.reversed].getDiagonalsNESW();

  int count = 0;

  for (final line in diagonalInput) {
    count += countMatches(line, _pattern);
    count += countMatches([...line.reversed], _pattern);
  }

  for (final line in otherDiagonalInput) {
    count += countMatches(line, _pattern);
    count += countMatches([...line.reversed], _pattern);
  }

  return count;
}

@visibleForTesting
int countMatches<T>(
  List<T> input,
  List<T> pattern, {
  bool Function(T, T)? compare,
}) {
  compare ??= (a, b) => a == b;

  if (input.isEmpty || pattern.isEmpty || input.length < pattern.length) {
    return 0;
  }

  int matchIndex = 0;
  int count = 0;

  for (int i = 0; i < input.length; i++) {
    if (i == input.length - pattern.length + 1 && matchIndex == 0) {
      break;
    } else if (!compare(input[i], pattern[matchIndex])) {
      matchIndex = 0;
    }

    if (compare(input[i], pattern[matchIndex])) {
      matchIndex++;

      if (matchIndex == pattern.length) {
        count++;
        matchIndex = 0;
      }
    }
  }

  return count;
}
