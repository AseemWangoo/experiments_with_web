import 'package:experiments_with_web/search/commands/search_command.dart';
import 'package:experiments_with_web/google/widgets/rounded-shape.dart';

import 'package:flutter/material.dart';

import 'transform_follower.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode focusNode = FocusNode();
  OverlayEntry overlayEntry;
  final LayerLink layerLink = LayerLink();

  final SearchCommand searchCommand = SearchCommand();

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

    return OverlayEntry(
        builder: (_) => Positioned(
              width: size.width,
              child: TransformFollower(
                offset: Offset(0.0, size.height - 10),
                link: layerLink,
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
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //

    return CompositedTransformTarget(
      link: layerLink,
      child: RoundedShape(
        bgColor: Colors.white30,
        focusNode: focusNode,
        onChanged: (term) {
          searchCommand.showSearchResults(term);
          debugPrint('>>> ${searchCommand.searchedResults.toString()}');
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
