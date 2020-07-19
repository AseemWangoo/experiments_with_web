import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class WidgetIFramer extends StatefulWidget {
  const WidgetIFramer({
    Key key,
    @required this.iframeSrc,
  }) : super(key: key);

  final String iframeSrc;

  @override
  _WidgetIFramerState createState() => _WidgetIFramerState();
}

class _WidgetIFramerState extends State<WidgetIFramer> {
  final IFrameElement _iframeElement = IFrameElement();
  Widget _iframeWidget;

  @override
  void initState() {
    super.initState();
    _iframeElement.height = '100%';
    _iframeElement.width = '100%';

    _iframeElement.src = widget.iframeSrc;
    _iframeElement.style.border = 'none';

    _platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(child: _iframeWidget);
}

// ignore: camel_case_types
class _platformViewRegistry {
  // ignore: always_declare_return_types
  static registerViewFactory(String viewId, dynamic cb) {
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewId, cb);
  }
}
