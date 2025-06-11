extension BooleanExtensions on bool {
  // / Returns the provided value if the boolean is true, otherwise returns null.
  E? orNull<E>(final E? value) {
    return this ? value! : null;
  }

  /// Returns the provided value if the boolean is false, otherwise returns null.
  E? inverseOrNull<E>(final E? value) {
    return this ? null : value;
  }
}
