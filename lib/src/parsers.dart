import 'package:petitparser/petitparser.dart';

/// A parser that parses a integer.
final numberParser = digit().plus().flatten().trim().map(int.parse);

/// A parser that parses a line with one or more integers.
final lineOfNumbersParser = numberParser.plus().end();
