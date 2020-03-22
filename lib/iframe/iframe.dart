import 'dart:html';
import 'dart:ui' as ui;

import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/iframe/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({Key key}) : super(key: key);

  @override
  _IframeScreenState createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  Widget _iframeWidget;

  final IFrameElement _iframeElement = IFrameElement();

  final _screenQueries = ScreenQueries.instance;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _iframeElement.height = '500';
    _iframeElement.width = '500';

    _iframeElement.src = 'https://www.youtube.com/embed/RQzhAQlg2JQ';
    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    final _width = _screenQueries.customWidthPercent(context, 0.75);
    final _height = _screenQueries.customHeightPercent(context, 0.75);

    return Scaffold(
      appBar: AppBar(
        title: Text('Iframe', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: SizedBox(
          height: _height,
          width: _width,
          child: _iframeWidget,
        ),
      ),
      bottomSheet: WebBottomSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Url please !!',
                      labelText: 'Enter url',
                    ),
                    controller: _textController,
                  ),
                ),
                Flexible(
                  child: FlatButton(
                    color: Colors.grey[800],
                    onPressed: () {
                      print(_textController.text);
                    },
                    child: Text('Go', style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
