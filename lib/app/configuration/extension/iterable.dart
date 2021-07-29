extension ExtendedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}

extension SafeLookup<E> on List<E> {
  E get(int index) {
    try {
      return this[index];
    } on RangeError {
      return null;
    }
  }
}


