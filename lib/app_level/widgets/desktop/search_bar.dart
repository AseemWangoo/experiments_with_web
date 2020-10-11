import 'package:experiments_with_web/search/commands/search_command.dart';
import 'package:experiments_with_web/google/widgets/rounded-shape.dart';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode focusNode = FocusNode();
  OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        overlayEntry = createOverlayEntry();
        Overlay.of(context).insert(overlayEntry);
      } else {
        overlayEntry?.remove();
      }
    });
  }

  OverlayEntry createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (_) => Positioned(
              left: offset.dx,
              top: offset.dy + size.height - 10,
              width: size.width,
              child: Material(
                elevation: 4.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: Text('Syria'),
                    ),
                    ListTile(
                      title: Text('Lebanon'),
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //

    return RoundedShape(
      bgColor: Colors.white30,
      focusNode: focusNode,
      onChanged: (term) {
        final _res = SearchCommand().showSearchResults(term);
        debugPrint(_res.toString());
      },
    );
  }

  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
  }
}
