import 'dart:io';

import 'buff_base.dart';

/// A [BufferInput] implementation that reads data from a file.
class FileBufferInput extends BufferInput {
  late RandomAccessFile _raf;

  /// Creates a new [FileBufferInput] instance with the given [file].
  FileBufferInput(File file) {
    _raf = file.openSync(mode: FileMode.read);
  }

  /// Creates a new [FileBufferInput] instance with the file at the given [path].
  factory FileBufferInput.fromPath(String path) {
    return FileBufferInput(File(path));
  }

  @override
  List<int> getBytes(int start, int end) {
    _raf.setPositionSync(start);
    return _raf.readSync(end - start);
  }

  @override
  int get length => throw UnimplementedError();

  @override
  void close() {
    _raf.closeSync();
  }
}

/// An asynchronous [BufferInput] implementation that reads data from a file.
class FileAsyncBufferInput extends AsyncBufferInput {
  final File file;

  late RandomAccessFile _raf;

  /// Creates a new [FileAsyncBufferInput] instance with the given [file].
  FileAsyncBufferInput(this.file) {
    _raf = file.openSync(mode: FileMode.read);
  }

  /// Creates a new [FileAsyncBufferInput] instance with the file at the given [path].
  factory FileAsyncBufferInput.fromPath(String path) {
    return FileAsyncBufferInput(File(path));
  }

  @override
  Future<List<int>> getBytes(int start, int end) {
    _raf.setPositionSync(start);
    return _raf.read(end - start);
  }

  @override
  Future<int> get length => file.length();

  @override
  Future<void> close() => _raf.close();
}
