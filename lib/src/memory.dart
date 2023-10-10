import 'dart:typed_data';

import 'buff_base.dart';

/// A [BufferInput] implementation that reads from a [List<int>] buffer.
class MemoryBufferInput extends BufferInput {
  /// The buffer to read from.
  final List<int> buffer;

  /// Creates a new [MemoryBufferInput] instance.
  MemoryBufferInput(this.buffer);

  @override
  List<int> getBytes(int start, int end) => buffer.sublist(start, end);

  @override
  int get length => buffer.length;

  @override
  void close() {}
}

/// An [AsyncBufferInput] implementation that reads from a [List<int>] buffer.
class MemoryAsyncBufferInput extends AsyncBufferInput {
  /// The buffer to read from.
  final List<int> buffer;

  /// Creates a new [MemoryAsyncBufferInput] instance.
  MemoryAsyncBufferInput(this.buffer);

  @override
  Future<List<int>> getBytes(int start, int end) =>
      Future.value(buffer.sublist(start, end));

  @override
  Future<int> get length => Future.value(buffer.length);

  @override
  Future<void> close() async {}
}

/// A [BufferInput] implementation that reads from a [ByteBuffer].
class ByteBufferInput extends BufferInput {
  /// The buffer to read from.
  final ByteBuffer buffer;

  /// Creates a new [ByteBufferInput] instance.
  ByteBufferInput(this.buffer);

  @override
  List<int> getBytes(int start, int end) {
    final length = end - start;
    return buffer.asByteData(start, length).buffer.asUint8List();
  }

  @override
  void close() {}

  @override
  int get length => buffer.lengthInBytes;
}

/// An [AsyncBufferInput] implementation that reads from a [ByteBuffer].
class AsyncByteBufferInput extends AsyncBufferInput {
  /// The buffer to read from.
  final ByteBuffer buffer;

  /// Creates a new [AsyncByteBufferInput] instance.
  AsyncByteBufferInput(this.buffer);

  @override
  Future<List<int>> getBytes(int start, int end) {
    final length = end - start;
    return Future.value(buffer.asByteData(start, length).buffer.asUint8List());
  }

  @override
  Future<void> close() async {}

  @override
  Future<int> get length => Future.value(buffer.lengthInBytes);
}
