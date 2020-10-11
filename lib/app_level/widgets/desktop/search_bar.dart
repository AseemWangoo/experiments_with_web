import 'package:experiments_with_web/app_level/widgets/desktop/spacer_view.dart';
import 'package:experiments_with_web/google/widgets/rounded-shape.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    return SpacerView(
      child: RoundedShape(
        bgColor: Colors.white30,
        onChanged: (val) {
          debugPrint('You searched >>> $val');
        },
      ),
    );
  }
}
