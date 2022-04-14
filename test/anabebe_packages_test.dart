import 'package:flutter_test/flutter_test.dart';

import 'package:anabebe_packages/anabebe_packages.dart';

void main() {
  test('adds one to input values', () {
    final logger = Logger();
    logger.setup('TEST');
    logger.log('test message');
  });
}
