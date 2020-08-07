import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

final _widgetRef = <int, HtmlElementWidgetState>{};

abstract class HtmlElementWidget extends StatefulWidget {
  const HtmlElementWidget({Key key}) : super(key: key);

  html.HtmlElement createHtmlElement(BuildContext context) {
    throw UnimplementedError("Can't be ignored");
  }

  @override
  HtmlElementWidgetState createState() => HtmlElementWidgetState();
}

class HtmlElementWidgetState<T extends HtmlElementWidget> extends State<T> {
  static bool _registered = false;

  @override
  void initState() {
    super.initState();
    if (!_registered) {
      _regPlatformView();
      _registered = true;
    }
  }

  void _regPlatformView() {
    if (kIsWeb) {
      ui.platformViewRegistry.registerViewFactory(
        'HtmlElementWidget',
        (int viewId) {
          final state = _widgetRef[viewId];
          assert(state != null);
          return state.createHtmlElement(context);
        },
      );
    }
  }

  html.HtmlElement createHtmlElement(BuildContext context) {
    return widget.createHtmlElement(context);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      onCreatePlatformView: (PlatformViewCreationParams params) {
        _widgetRef[params.id] = this;
        final _controller = _HtmlElementViewController(params);
        _controller._init().then((_) {
          params.onPlatformViewCreated(params.id);
        });

        return _controller;
      },
      surfaceFactory: (_, PlatformViewController controller) {
        return PlatformViewSurface(
          controller: controller,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        );
      },
      viewType: 'HtmlElementWidget',
    );
  }
}

// ****************************** INTERNALS ******************************

class _HtmlElementViewController extends PlatformViewController {
  _HtmlElementViewController(this.params);

  final PlatformViewCreationParams params;

  bool _initialized = false;

  Future<void> _init() async {
    final args = <String, dynamic>{
      'id': viewId,
      'viewType': params.viewType,
    };

    await SystemChannels.platform_views.invokeMethod<void>('create', args);
    _initialized = true;
  }

  @override
  Future<void> clearFocus() async {
    // Currently this does nothing on Flutter Web.
    // Excerpt taken from `platform_view.dart`
  }

  @override
  Future<void> dispatchPointerEvent(PointerEvent event) async {
    // We do not dispatch pointer events to HTML views because they may contain
    // cross-origin iframes, which only accept user-generated events.
    // Excerpt taken from `platform_view.dart`
  }

  @override
  Future<void> dispose() async {
    if (_initialized) {
      // ignore: unawaited_futures
      SystemChannels.platform_views.invokeMethod<void>('dispose', viewId);
    }
  }

  @override
  int get viewId => params.id;
}

// https://github.com/flutter/flutter/issues/55904
