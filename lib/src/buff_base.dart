import 'dart:typed_data';

import 'memory.dart';

/// An abstract class representing a buffer input.
abstract class BufferInput {

  BufferInput();

  /// Creates a [BufferInput] from a list of bytes.
  factory BufferInput.memory(List<int> bytes) = MemoryBufferInput;

  /// Creates a [BufferInput] from a byte buffer.
  factory BufferInput.buffer(ByteBuffer bytes) = ByteBufferInput;

  /// Returns a list of bytes from the buffer input, starting from [start] and ending at [end].
  List<int> getBytes(int start, int end);

  /// Returns the length of the buffer input.
  int get length;

  /// Closes the buffer input.
  void close();
}

/// An abstract class representing an asynchronous buffer input.
abstract class AsyncBufferInput {

  AsyncBufferInput();

  /// Creates an [AsyncBufferInput] from a list of bytes.
  factory AsyncBufferInput.memory(List<int> bytes) = MemoryAsyncBufferInput;

  /// Creates an [AsyncBufferInput] from a byte buffer.
  factory AsyncBufferInput.buffer(ByteBuffer bytes) = AsyncByteBufferInput;

  /// Returns a future that completes with a list of bytes from the buffer input, starting from [start] and ending at [end].
  Future<List<int>> getBytes(int start, int end);

  /// Returns a future that completes with the length of the buffer input.
  Future<int> get length;

  /// Closes the buffer input.
  Future<void> close();
}
