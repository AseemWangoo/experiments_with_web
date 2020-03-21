import 'package:experiments_with_web/google/helpers/constants.dart';
import 'package:experiments_with_web/google/helpers/dimensions.dart'
    as dimensions;

import 'package:flutter/material.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0.0, 0.5),
              blurRadius: 5.0,
              spreadRadius: 0.3,
            )
          ],
        ),
        width: dimensions.adjustWidth(googleSearchPercent, _width),
        child: _customTextField(context),
      ),
    );
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
        prefixIcon: const Icon(Icons.search, color: Colors.orange, size: 18.0),
      ),
      maxLines: 1,
    );
  }
}
