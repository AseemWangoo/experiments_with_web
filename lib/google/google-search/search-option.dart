import 'package:experiments_with_web/google/helpers/constants.dart';
import 'package:experiments_with_web/google/helpers/dimensions.dart'
    as dimensions;
import 'package:experiments_with_web/google/widgets/custom-button.dart';
import 'package:experiments_with_web/google/widgets/option-name.dart';
import 'package:experiments_with_web/google/widgets/rounded-shape.dart';

import 'package:flutter/material.dart';

class GoogleSearch extends StatelessWidget {
  ///Crux of the screen (Google search)....
  const GoogleSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Begin...

    return _constructBody(context);
  }

  //Main widget body....
  Widget _constructBody(BuildContext context) {
    //Begin...

    final _height = dimensions.height(context);

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                googleLogo,
                height: dimensions.adjustHeight(googleLogoPercent, _height),
              ),
            ),
            Flexible(
              child: RoundedShape(
                bgColor: Colors.white.withOpacity(0.9),
                cursorColor: Colors.black,
                iconColor: Colors.orange,
                textColor: Colors.black,
              ),
            ),
            Flexible(child: _customSearchButtons(context)),
            Flexible(child: _customLanguageOptions(context)),
          ],
        ),
      ),
    );
  }

  //Creates the search buttons...
  Widget _customSearchButtons(BuildContext context) {
    //Begin...

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          optionName: googleSearchButtonText,
          actionOnClick: (option) {
            print('$option was clicked');
          },
        ),
        const SizedBox(width: 20.0),
        CustomButton(
          optionName: googleFeelingLuckyButtonText,
          actionOnClick: (option) {
            print('$option was clicked');
          },
        ),
      ],
    );
  }

  //Creates the options for google support...
  Widget _customLanguageOptions(BuildContext context) {
    //Begin...

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(googleOfferedText),
        for (var option in googleLanguageOptions)
          OptionWidget(
            optionName: option,
            actionOnClick: (option) async {
              print('Woohoo $option');
            },
          ),
      ],
    );
  }
}
