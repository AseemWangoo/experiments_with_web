import 'package:experiments_with_web/app_level/widgets/desktop/spacer_view.dart';
import 'package:experiments_with_web/google/widgets/rounded-shape.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return SpacerView(
      child: RoundedShape(
        bgColor: Colors.white30,
        cursorColor: Colors.white,
        iconColor: Colors.white,
        textColor: Colors.white,
        onChanged: (val) {
          debugPrint('You searched >>> $val');
        },
      ),
    );
  }
}
