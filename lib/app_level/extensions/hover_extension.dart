import 'dart:html' as html;

import 'package:flutter/material.dart' show MouseRegion, Widget;

extension HoverExtension on Widget {
  // Reference of the website dom...
  static final websiteBodyContainer = html.window.document.getElementById(
    'body-container',
  );

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) => websiteBodyContainer.style.cursor = 'pointer',
      onExit: (event) => websiteBodyContainer.style.cursor = 'default',
    );
  }
}
