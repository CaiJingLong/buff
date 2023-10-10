import 'package:buff/buff.dart';

/// A custom implementation of [AsyncBufferInput] that allows for custom functions
/// to be used for getting bytes, getting length, and closing the input.
class CustomAsyncBufferInput extends AsyncBufferInput {
  /// A function that returns a [Future] that resolves to a list of bytes between
  /// the given [start] and [end] indices.
  final Future<List<int>> Function(int start, int end) getBytesFunc;

  /// A function that returns a [Future] that resolves to the length of the input.
  final Future<int> Function() getLengthFunc;

  /// A function that returns a [Future] that resolves when the input is closed.
  final Future<void> Function() closeFunc;

  /// Creates a new instance of [CustomAsyncBufferInput] with the given functions.
  ///
  /// The [getBytesFunc] function should return a [Future] that resolves to a list
  /// of bytes between the given [start] and [end] indices.
  ///
  /// The [getLengthFunc] function should return a [Future] that resolves to the
  /// length of the input.
  ///
  /// The [closeFunc] function should return a [Future] that resolves when the
  /// input is closed.
  CustomAsyncBufferInput({
    required this.getBytesFunc,
    required this.getLengthFunc,
    required this.closeFunc,
  });

  @override
  Future<List<int>> getBytes(int start, int end) => getBytesFunc(start, end);

  @override
  Future<int> get length => getLengthFunc();

  @override
  Future<void> close() => closeFunc();
}
