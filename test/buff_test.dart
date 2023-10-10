import 'dart:io';
import 'dart:typed_data';

import 'package:buff/buff_io.dart';
import 'package:test/test.dart';

void main() {
  test('BufferInput should return the correct bytes', () {
    final bytes = Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    final bufferInput = BufferInput.memory(bytes);
    final buffer = bufferInput.getBytes(2, 6);
    expect(buffer, equals([3, 4, 5, 6]));
    bufferInput.close();
  });

  test('AsyncBufferInput should return the correct bytes', () async {
    final bytes = Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    final asyncBufferInput = AsyncBufferInput.memory(bytes);
    final buffer = await asyncBufferInput.getBytes(4, 6);
    expect(buffer, equals([5, 6]));
    asyncBufferInput.close();
  });

  group('Test file', () {
    final path = 'test/test.txt';
    final file = File(path);
    setUp(() {
      final bytes =
          Uint8List.fromList([49, 50, 51, 52, 53, 54, 55, 56, 57, 48]);

      file.writeAsBytesSync(bytes);
    });

    test('FileBufferInput should return the correct bytes', () {
      final fileBufferInput = FileBufferInput.fromPath('test/test.txt');
      final buffer = fileBufferInput.getBytes(2, 6);
      expect(buffer, equals([51, 52, 53, 54]));
      fileBufferInput.close();
    });

    test('FileAsyncBufferInput should return the correct bytes', () async {
      final fileAsyncBufferInput =
          FileAsyncBufferInput.fromPath('test/test.txt');
      final buffer = await fileAsyncBufferInput.getBytes(4, 6);
      expect(buffer, equals([53, 54]));
      fileAsyncBufferInput.close();
    });

    tearDown(() {
      file.deleteSync();
    });
  });
}
