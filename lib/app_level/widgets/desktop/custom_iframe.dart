import 'dart:html';

import 'package:experiments_with_web/app_level/utilities/html_element.dart';
import 'package:flutter/material.dart';

class IframeWidget extends HtmlElementWidget {
  const IframeWidget({
    Key key,
    @required this.src,
    this.width = 640.0,
    this.height = 360.0,
    this.style = 'border: none;',
    this.allow =
        'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture',
    this.allowFullscreen = true,
  }) : super(key: key);

  final String src;

  final double width;
  final double height;
  final String style;
  final String allow;
  final bool allowFullscreen;

  @override
  HtmlElement createHtmlElement(BuildContext context) {
    return IFrameElement()
      ..width = width.toString()
      ..height = height.toString()
      ..src = src
      ..style.cssText = style
      ..allow = allow
      ..allowFullscreen = allowFullscreen;
  }
}
