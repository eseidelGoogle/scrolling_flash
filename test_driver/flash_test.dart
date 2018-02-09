import 'dart:async';

// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('scrolling test', () {
    FlutterDriver driver;

    setUpAll(() async {
      // Connects to the app
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        // Closes the connection
        driver.close();
      }
    });

    test('measure', () async {
      // Record the performance timeline of things that happen inside the closure
      // Find the scrollable user list
      SerializableFinder userList = find.byValueKey('user-list');

      int iterations = 3;
      int spacingSize = 20; // has to be over 16?
      // Seems to make the screen turn white and stay white:
      // double scrollSize = 100.0;
      // int scrollNumber = 7;
      // also stays white:
      // double scrollSize = 50.0;
      // int scrollNumber = 14;
      // does not stay white:
      double scrollSize = 10.0;
      int scrollNumber = 70;
    
      for (int j = 0; j < iterations; j++) {
        for (int i = 0; i < scrollNumber; i++) {
          await driver.scroll(userList, 0.0, -1.0 * scrollSize,
              new Duration(milliseconds: spacingSize));

          // Emulate a user's finger taking its time to go back to the original
          // position before the next scroll
          await new Future<Null>.delayed(
              new Duration(milliseconds: spacingSize));
        }

        for (int i = 0; i < scrollNumber; i++) {
          await driver.scroll(userList, 0.0, scrollSize,
              new Duration(milliseconds: spacingSize));
          await new Future<Null>.delayed(
              new Duration(milliseconds: spacingSize));
        }
      }
    });
  });
}
