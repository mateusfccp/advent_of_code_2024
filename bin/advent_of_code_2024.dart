import 'dart:io';

import 'package:advent_of_code_2024/day_1.dart' as day_1;
import 'package:advent_of_code_2024/day_2.dart' as day_2;
import 'package:advent_of_code_2024/day_3.dart' as day_3;

/// A function that solves a puzzle given an input.
typedef PuzzleSolver<T> = T Function(String input);

void main(List<String> arguments) async {
  final String dataDirectory;

  if (arguments.length == 1) {
    dataDirectory = arguments[0];
  } else {
    throw ArgumentError('Expected one argument: the data directory.');
  }

  stdout.writeln('***** Advent of Code 2024 *****\n');

  stdout.writeln('Solving challenges from $dataDirectory...\n');

  Future<void> solveDay<T>(int day, int puzzleNumber, PuzzleSolver<T> solver) async {
    final input = await File('$dataDirectory/day_$day').readAsString();
    final result = solver(input);
    stdout.writeln('Day $day, puzzle $puzzleNumber: $result');
  }

  // Day 1
  await solveDay(1, 1, day_1.puzzle1);
  await solveDay(1, 2, day_1.puzzle2);

  // Day 2
  await solveDay(2, 1, day_2.puzzle1);
  await solveDay(2, 2, day_2.puzzle2);

  // Day 3
  await solveDay(3, 1, day_3.puzzle1);
  await solveDay(3, 2, day_3.puzzle2);
}
