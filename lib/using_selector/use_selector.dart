import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/centered_form.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_input_field.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_data.dart';
import 'utilities/constants.dart';

class UseSelector extends StatelessWidget {
  const UseSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleText: SelectorsConstants.title,
      child: Center(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserData()),
          ],
          child: _InternalWidget(),
        ),
      ),
    );
  }
}

class _InternalWidget extends StatelessWidget {
  const _InternalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredForm(
      children: [
        CustomInputField(
          onChanged: (val) {},
          hintText: SelectorsConstants.field1InputHint,
          labelText: SelectorsConstants.field1Hint,
        ),
        CustomInputField(
          onChanged: (val) {},
          hintText: SelectorsConstants.field2InputHint,
          labelText: SelectorsConstants.field2Hint,
        ),
        CustomInputField(
          onChanged: (val) {},
          hintText: SelectorsConstants.field3InputHint,
          labelText: SelectorsConstants.field3Hint,
        ),
      ],
    );
  }
}
