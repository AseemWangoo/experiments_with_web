import 'package:experiments_with_web/app_level/styles/themes.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/centered_form.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_input_field.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/field_hint.dart';
import 'package:experiments_with_web/streams/utilities/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/form_hooks.dart';

class StreamForm extends StatelessWidget {
  const StreamForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleText: StreamFormConstants.title,
      child: _StreamsView(),
    );
  }
}

class _StreamsView extends HookWidget {
  const _StreamsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formHooks = FormHooks();

    return CenteredForm(
      children: [
        FieldHint(
          child: StreamBuilder<String>(
            stream: _formHooks.field1Stream,
            builder: (context, snapshot) => CustomInputField(
              autofocus: true,
              onChanged: (val) {
                _formHooks.field1Controller.add(val);
                // _model.name = _promocodeName;
              },
              //     initialValue: _model.name,
              hintText: StreamFormConstants.field1InputHint,
              labelText: StreamFormConstants.field1Label,
              showError: snapshot.hasError,
              errorText: snapshot.error.toString(),
            ),
          ),
          hintText: StreamFormConstants.field1Hint,
        ),
      ],
    );
  }
}
