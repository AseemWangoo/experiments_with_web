import 'package:experiments_with_web/app_level/assets/assets.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class BgWidget extends StatelessWidget {
  const BgWidget({Key key, @required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    //

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        FlareActor(
          WebAssets.flareBkgrd.assetName,
          // alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
          animation: 'Untitled',
        ),
        const Positioned(
          bottom: 40.0,
          child: _CustomText(data: 'Flattered with Flutter'),
        ),
        ...children,
      ],
    );
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText({Key key, this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    //

    return Text(
      data,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
      ),
    );
  }
}
