import 'package:experiments_with_web/app_level/styles/themes.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/centered_form.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_dialog.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_input_field.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/hooks/models/suggestion.dart';
import 'package:experiments_with_web/hooks/utilities/constants.dart';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class HooksScreen extends HookWidget {
  const HooksScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    final _field = useTextEditingController.fromValue(
      TextEditingValue.empty,
    );

    final _onSavePressed = useState(false);

    debugPrint('IM BUILDING');

    return CustomScaffold(
      titleText: HookScreenConstants.hookTitle,
      child: CenteredForm(
        children: [
          Text(
            HookScreenConstants.formTitle,
            style: AppTheme.darkTheme.textTheme.headline4,
          ),
          HookBuilder(
            builder: (_) {
              useValueListenable(_field);

              return CustomInputField(
                onChanged: (_) {},
                hintText: HookScreenConstants.personFieldHint,
                labelText: HookScreenConstants.personLabel,
                showError: _onSavePressed.value && _field.text.isEmpty,
                textController: _field,
              );
            },
          ),
          RaisedButton.icon(
            onPressed: () {
              final _model = Suggestion(personName: _field.text);
              _onSavePressed.value = true;

              if (_onSavePressed.value) {
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    child: Column(
                      children: [
                        Text('${_model.toJson()}'),
                      ],
                    ),
                  ),
                );
              }
              _field.text;
            },
            icon: Icon(Icons.save),
            label: Text('Save'),
          ),
        ],
      ),
    );
  }
}
