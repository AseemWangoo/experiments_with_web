import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/generic_dialog.dart';
import 'package:experiments_with_web/hooks/api/suggestion_api.dart';
import 'package:experiments_with_web/hooks/models/suggestion.dart';
import 'package:experiments_with_web/hooks/models/suggestion_resp.dart';
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

  Iterable<MapEntry<String, String>> get _onGenerateFields {
    final _fieldValues = {
      HookScreenConstants.field1: _namefield.text,
      HookScreenConstants.field2: _tutNamefield.text,
      HookScreenConstants.field3: _emailfield.text,
      HookScreenConstants.field4: _handlefield.text,
      HookScreenConstants.field5: _tutDescfield.text,
    };

    return _fieldValues.entries;
  }

  @override
  Widget build(BuildContext context) {
    //

    return ElevatedButton.icon(
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
          _showDialog(context, _model);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.brandColor),
      ),
      icon: Icon(Icons.save, color: Colors.white),
      label: Text(
        HookScreenConstants.saveBtn,
        style: TextStyle().c(Colors.white),
      ),
    );
  }

  void _showDialog(BuildContext c, Suggestion _model) async {
    //
    final _width = ScreenQueries.instance.width(c);

    return showDialog(
      context: c,
      builder: (_) {
        return AlertDialog(
          title: const Text(HookScreenConstants.review),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final _fieldValue in _onGenerateFields) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: _width * 0.1,
                      child: Text(_fieldValue.key),
                    ),
                    SizedBox(
                      child: Text(
                        _fieldValue.value,
                        style: const TextStyle().bold,
                      ),
                      width: _width * 0.1,
                    ),
                  ],
                )
              ],
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(HookScreenConstants.editBtn),
              onPressed: () => Navigator.of(c).pop(),
            ),
            FlatButton(
              child: Text(HookScreenConstants.saveBtn),
              onPressed: () async {
                Navigator.of(c).pop();
                final _data = await SuggestionApi.sendData(_model);
                _respDialog(c, _data);
              },
            ),
          ],
        );
      },
    );
  }

  void _respDialog(BuildContext c, SuggestionResponse _data) async {
    //

    return showDialog(
      context: c,
      builder: (_) {
        return GenericDialog(
          children: [
            Text('Received : ${_data.status.toString()}'),
            Text('Description : ${_data.response}'),
          ],
        );
      },
    );
  }
}
