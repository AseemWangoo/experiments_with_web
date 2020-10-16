import 'package:experiments_with_web/search/commands/search_command.dart';
import 'package:experiments_with_web/google/widgets/rounded-shape.dart';

import 'package:flutter/material.dart';

import '../../app_level/widgets/desktop/transform_follower.dart';
import '../commands/results_command.dart';

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
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (!focusNode.hasFocus) {
        controller.text = '';
        searchCommand.searchedResults.clear();
      }
    });

    // OPTIMIZE THIS
    searchCommand.addListener(() {
      if (focusNode.hasFocus) {
        overlayEntry = createOverlayEntry();
        Overlay.of(context).insert(overlayEntry);
      } else {
        overlayEntry?.remove();
      }
      setState(() {});
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
                for (var item in searchCommand.searchedResults)
                  ListTile(
                    tileColor: Colors.black54,
                    title: Text(item, style: TextStyle(color: Colors.white)),
                    onTap: () => SearchResultCommand().tap(
                      item,
                      controller.text,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    // debugPrint('>>> ${searchCommand.searchedResults.toString()}');

    return CompositedTransformTarget(
      link: layerLink,
      child: RoundedShape(
        textController: controller,
        bgColor: Colors.white30,
        focusNode: focusNode,
        onChanged: (term) => searchCommand.showSearchResults(term),
      ),
    );
  }

  @override
  void dispose() {
    focusNode?.dispose();
    // controller?.dispose();
    super.dispose();
  }
}
