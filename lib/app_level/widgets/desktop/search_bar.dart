import 'package:experiments_with_web/app_level/widgets/desktop/spacer_view.dart';
import 'package:experiments_with_web/google/widgets/rounded-shape.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        debugPrint('I HAVE FOCUS');
      } else {
        debugPrint('NO FOCUS');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    return SpacerView(
      child: RoundedShape(
        bgColor: Colors.white30,
        focusNode: focusNode,
        onChanged: (val) {
          debugPrint('You searched >>> $val');
        },
      ),
    );
  }

  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
  }
}
