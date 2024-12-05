import 'package:advent_of_code_2024/src/parsers.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:petitparser/petitparser.dart';

/// Solves the first part of day 5.
int part1(String input) {
  final inputParser = rulesParser & char('\n').star().flatten() & updatesParser;

  final Map<int, List<int>> beforenessMap;
  final List<List<int>> updates;

  [beforenessMap, _, updates] = inputParser.parse(input).value;

  int sum = 0;

  for (final update in updates) {
    final invalidItem = getUpdateFirstInvalidItem(update, beforenessMap);

    if (invalidItem == null) {
      final middle = update.length ~/ 2;
      sum = sum + update[middle];
    }
  }

  return sum;
}

/// Solves the first part of day 5.
int part2(String input) {
  final inputParser = rulesParser & char('\n').star().flatten() & updatesParser;

  final Map<int, List<int>> beforenessMap;
  final List<List<int>> updates;

  [beforenessMap, _, updates] = inputParser.parse(input).value;

  int sum = 0;

  for (final update in updates) {
    final invalidItem = getUpdateFirstInvalidItem(update, beforenessMap);

    if (invalidItem != null) {
      rectifyUpdate(update, beforenessMap, start: invalidItem);

      final middle = update.length ~/ 2;
      sum = sum + update[middle];
    }
  }

  return sum;
}

/// Returns the first invalid item in the update list.
///
/// If the update list is valid, returns `null`.
@visibleForTesting
int? getUpdateFirstInvalidItem(List<int> update, Map<int, List<int>> beforenessMap) {
  for (int i = 1; i < update.length; i++) {
    final currentPage = update[i];

    for (final pageBefore in update.sublist(0, i)) {
      if (beforenessMap[currentPage]?.contains(pageBefore) ?? false) {
        return i;
      }
    }
  }

  return null;
}

/// Rectifies the update list.
@visibleForTesting
void rectifyUpdate(
  List<int> update,
  Map<int, List<int>> beforenessMap, {
  required int start,
}) {
  assert(start > 0);
  update.swap(start - 1, start);

  int index = start - 1;

  while (index < update.length) {
    final currentPage = update[index];

    if (index == 0) {
      index++;
    } else {
      final pageBefore = update[index - 1];

      if (beforenessMap[currentPage]?.contains(pageBefore) ?? false) {
        update.swap(index, index - 1);
        index--;
      } else {
        index++;
      }
    }
  }
}

@visibleForTesting
final rulesParser = ruleParser.plus().map((value) => value.fold<Map<int, List<int>>>({}, _foldIntoBeforenessMap));

@visibleForTesting
final ruleParser = (numberParser & char('|') & numberParser).map((value) => (value[0], value[2]) as (int, int));

@visibleForTesting
final updatesParser = updateParser.plus();

@visibleForTesting
final updateParser = numberParser.plusSeparated(char(',')).map((value) => value.elements);

Map<int, List<int>> _foldIntoBeforenessMap(Map<int, List<int>> current, (int, int) next) {
  final (a, b) = next;

  if (current[a] case final al?) {
    al.add(b);
  } else {
    current[a] = [b];
  }

  return current;
}
