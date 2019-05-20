import 'package:experiments_with_web/google/helpers/constants.dart';
import 'package:flutter_web/material.dart';
import 'package:experiments_with_web/google/helpers/dimensions.dart'
    as dimensions;

class RoundedShape extends StatelessWidget {
  ///Creates the rounded shape widget..
  const RoundedShape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //begin...

    return _constructBody(context);
  }

  //Main widget...
  Widget _constructBody(BuildContext context) {
    //Begin...
    final _width = dimensions.width(context);
    // final radius = BorderRadius.all(Radius.circular(22.0));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 0.5),
          // borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        width: dimensions.adjustWidth(googleSearchPercent, _width),
        child: _customTextField(context),
      ),
    );

    // return Material(
    //   shape: RoundedRectangleBorder(borderRadius: radius),
    //   color: Colors.black.withOpacity(0.05),
    //   child: InkWell(
    //     // borderRadius: radius,
    //     splashColor: Colors.transparent,
    //     child: Container(
    //       child: _customTextField(context),
    //       width: dimensions.adjustWidth(googleSearchPercent, _width),
    //     ),
    //   ),
    // );
  }

  //Constructs the search text widget...
  Widget _customTextField(BuildContext context) {
    //begin...

    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 13.0),
      ),
      maxLines: 1,
    );
  }
}
