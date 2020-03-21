import 'package:experiments_with_web/google/helpers/constants.dart';
import 'package:experiments_with_web/google/widgets/option-name.dart';
import 'package:experiments_with_web/google/widgets/submenu.dart';

import 'package:flutter/material.dart';

class GoogleMenuOptions extends StatelessWidget {
  ///Displays the top menu....
  const GoogleMenuOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Calls the construt body widget...

    return _constructBody(context);
  }

  //Main widget body....
  Widget _constructBody(BuildContext context) {
    //Begin...

    return Row(
      children: [
        const Spacer(),
        for (var option in topOptions)
          OptionWidget(
            optionName: option,
            actionOnClick: (option) async {
              print('Woohoo $option');
            },
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.apps),
        ),
        SubMenuOption(
          optionName: googleSignIn,
          actionOnClick: (option) {
            print('$option was clicked');
          },
        ),
        const SizedBox(width: 20.0)
      ],
    );
  }
}
