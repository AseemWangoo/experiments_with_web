import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/home/widgets/header.dart';
import 'package:experiments_with_web/home/widgets/top_nav.dart';

import 'package:flutter/material.dart';

class OptionMobile extends StatefulWidget {
  const OptionMobile({Key key}) : super(key: key);

  @override
  _OptionMobileState createState() => _OptionMobileState();
}

class _OptionMobileState extends State<OptionMobile> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    //
    return SimpleSliverScaffold(
      controller: _controller,
      minHeight: 120.0,
      maxHeight: 120.0,
      menu: TopNavBar(controller: _controller),
      children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 88),
              child: Header(
                color: Colors.orange,
                text: 'Mobile Links',
              ),
            ),
          ],
          shrinkWrap: true,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
