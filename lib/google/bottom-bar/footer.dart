import 'package:experiments_with_web/google/helpers/constants.dart';
import 'package:experiments_with_web/google/widgets/option-name.dart';
import 'package:experiments_with_web/google/widgets/text.dart';

import 'package:flutter/material.dart';

class FooterOptions extends StatelessWidget {
  ///Creates the footer of the screen....
  const FooterOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Begin...

    return _constructBody(context);
  }

  //Main widget body....
  Widget _constructBody(BuildContext context) {
    //Begin...

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.1),
        color: Colors.black.withOpacity(0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(child: _userLocation(context)),
          Flexible(child: _customFooterOptions(context)),
        ],
      ),
    );
  }

  //Location for the user in footer...
  Widget _userLocation(BuildContext context) {
    //Begin...

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GoogleText(optionName: footerCountryText),
        const Spacer(),
      ],
    );
  }

  //Creates the options for footer...
  Widget _customFooterOptions(BuildContext context) {
    //Begin...

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var option in googleFooterOptions)
            OptionWidget(
              optionName: option,
              actionOnClick: (option) async {
                print('Woohoo $option');
              },
            ),
        ]..insert(3, const Spacer()),
      ),
    );
  }
}
