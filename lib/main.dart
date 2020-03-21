// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:experiments_with_web/normal/main.dart' as normal;
import 'package:experiments_with_web/google/main.dart' as google;

main() async {
  final flavor = WorkToShow.google;
  print("\n\n===== Running: $flavor =====\n\n");

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
