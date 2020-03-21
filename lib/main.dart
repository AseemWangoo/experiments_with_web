import 'package:experiments_with_web/normal/main.dart' as normal;
import 'package:experiments_with_web/google/main.dart' as google;

import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const flavor = WorkToShow.google;

  switch (flavor) {

    //Clone of Google....
    case WorkToShow.google:
      google.main();
      return;

    case WorkToShow.normal:
      normal.main();
      return;
  }
}

enum WorkToShow {
  google,
  normal,
}
