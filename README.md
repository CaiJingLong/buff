# Buff

A Dart library for buffering and manipulating data.

## Includes

```yaml
dependencies:
  buff: ^1.0.0
```

## Usage

A simple usage example:

```dart
import 'dart:typed_data';

import 'package:buff/buff.dart';

void main() {
  final bytes = Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  
  // Using BufferInput
  final bufferInput = BufferInput.memory(bytes);
  final buffer = bufferInput.getBytes(2, 6);
  print(buffer); // Output: [3, 4, 5, 6]
  bufferInput.close();
  
  // Using AsyncBufferInput
  final asyncBufferInput = AsyncBufferInput.memory(bytes);
  asyncBufferInput.getBytes(4, 6).then((buffer) {
    print(buffer); // Output: [3, 4]
    asyncBufferInput.close();
  });
}

```

## LICENSE

[Apache 2.0](LICENSE)
