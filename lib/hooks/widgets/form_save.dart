import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_dialog.dart';
import 'package:experiments_with_web/hooks/models/suggestion.dart';
import 'package:experiments_with_web/hooks/utilities/constants.dart';

import 'package:flutter/material.dart';

class FormSave extends StatelessWidget {
  const FormSave({
    Key key,
    @required TextEditingController namefield,
    @required TextEditingController tutNamefield,
    @required TextEditingController emailfield,
    @required TextEditingController handlefield,
    @required TextEditingController tutDescfield,
    @required ValueNotifier<bool> onSavePressed,
    @required bool validateFields,
  })  : _namefield = namefield,
        _tutNamefield = tutNamefield,
        _emailfield = emailfield,
        _handlefield = handlefield,
        _tutDescfield = tutDescfield,
        _onSavePressed = onSavePressed,
        _validateFields = validateFields,
        super(key: key);

  final TextEditingController _namefield;
  final TextEditingController _tutNamefield;
  final TextEditingController _emailfield;
  final TextEditingController _handlefield;
  final TextEditingController _tutDescfield;
  final ValueNotifier<bool> _onSavePressed;
  final bool _validateFields;

  @override
  Widget build(BuildContext context) {
    //

    return RaisedButton.icon(
      onPressed: () {
        final _model = Suggestion(
          personName: _namefield.text,
          tutorialName: _tutNamefield.text,
          email: _emailfield.text,
          handle: _handlefield.text,
          tutorialDesc: _tutDescfield.text,
        );
        _onSavePressed.value = true;

        if (_validateFields) {
          showDialog(
            context: context,
            builder: (_) => CustomDialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${_model.toJson()}'),
                ],
              ),
            ),
          );
        }
      },
      color: AppColors.brandColor,
      icon: Icon(Icons.save, color: Colors.white),
      label: Text(
        HookScreenConstants.saveBtn,
        style: TextStyle().c(Colors.white),
      ),
    );
  }
}
