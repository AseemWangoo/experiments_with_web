import 'package:experiments_with_web/google/bottom-bar/footer.dart';
import 'package:experiments_with_web/google/google-search/search-option.dart';
import 'package:experiments_with_web/google/top-bar/menu-options.dart';

import 'package:flutter/material.dart';

class GoogleCloneScreen extends StatelessWidget {
  const GoogleCloneScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement scaffold...

    return Scaffold(
      body: Column(
        children: const <Widget>[
          Flexible(
            flex: 1,
            child: GoogleMenuOptions(),
          ),
          Flexible(
            flex: 8,
            child: GoogleSearch(),
          ),
          Flexible(
            flex: 1,
            child: FooterOptions(),
          ),
        ],
      ),
    );
  }
}
