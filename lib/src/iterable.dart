/// Extension methods for the [Iterable] class.
extension IterableExtension<E> on Iterable<E> {
  /// Counts the occurrences of an element in an iterable.
  int count(E element) {
    final iterator = this.iterator;
    int count = 0;

    while (iterator.moveNext()) {
      if (iterator.current == element) {
        count++;
      }
    }

    return count;
  }
}

/// Zips two iterables into a single iterable of pairs.
///
/// The resulting iterable will have the length of the shortest of the two
/// iterables.
Iterable<(T, U)> zip2<T, U>(Iterable<T> first, Iterable<U> second) sync* {
  final firstIterator = first.iterator;
  final secondIterator = second.iterator;

  while (firstIterator.moveNext() && secondIterator.moveNext()) {
    yield (firstIterator.current, secondIterator.current);
  }
}
