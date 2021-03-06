import 'package:experiments_with_web/app_level/widgets/desktop/centered_form.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_drawer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_input_field.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/field_hint.dart';
import 'package:experiments_with_web/streams/utilities/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/form_hooks.dart';
import 'models/form_model.dart';

class StreamForm extends StatelessWidget {
  const StreamForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showDrawer: true,
      drawerChild: CustomDrawer(
        medium: StreamFormConstants.medium,
        youtubeLink: StreamFormConstants.youtube,
        website: StreamFormConstants.website,
      ),
      titleText: StreamFormConstants.title,
      child: _StreamsView(),
    );
  }
}

class _StreamsView extends HookWidget {
  const _StreamsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = FormData();
    final _formHooks = FormHooks();
    // debugPrint('IM BUILDING 👀 👀');

    return Center(
      child: CenteredForm(
        children: [
          FieldHint(
            child: StreamBuilder<String>(
              stream: _formHooks.field1Stream,
              builder: (context, snapshot) => CustomInputField(
                autofocus: true,
                onChanged: (val) {
                  _formHooks.field1Controller.add(val);
                  data.first = val;
                },
                initialValue: data.first,
                hintText: StreamFormConstants.field1InputHint,
                labelText: StreamFormConstants.field1Label,
                showError: snapshot.hasError,
                errorText: snapshot.error.toString(),
              ),
            ),
            hintText: StreamFormConstants.field1Hint,
          ),
          FieldHint(
            child: StreamBuilder<String>(
              stream: _formHooks.field2Stream,
              builder: (context, snapshot) => CustomInputField(
                onChanged: (val) {
                  _formHooks.field2Controller.add(val);
                  data.second = val;
                },
                initialValue: data.second,
                hintText: StreamFormConstants.field2InputHint,
                labelText: StreamFormConstants.field2Label,
                showError: snapshot.hasError,
                errorText: snapshot.error.toString(),
              ),
            ),
            hintText: StreamFormConstants.field2Hint,
          ),
          FieldHint(
            child: StreamBuilder<String>(
              stream: _formHooks.field3Stream,
              builder: (context, snapshot) => CustomInputField(
                onChanged: (val) {
                  _formHooks.field3Controller.add(val);
                  data.third = val;
                },
                initialValue: data.third,
                hintText: StreamFormConstants.field3InputHint,
                labelText: StreamFormConstants.field3Label,
                showError: snapshot.hasError,
                errorText: snapshot.error.toString(),
              ),
            ),
            hintText: StreamFormConstants.field3Hint,
          ),
          _SaveForm(formHooks: _formHooks, data: data),
        ],
      ),
    );
  }
}

class _SaveForm extends StatelessWidget {
  const _SaveForm({
    Key key,
    @required this.formHooks,
    @required this.data,
  }) : super(key: key);

  final FormHooks formHooks;
  final FormData data;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          label: const Text(StreamFormConstants.back),
          icon: const Icon(Icons.chevron_left),
        ),
        StreamBuilder<bool>(
          initialData: true,
          stream: formHooks.isFormValid,
          builder: (context, snapshot) {
            final _isEnabled = snapshot.data;

            return ElevatedButton.icon(
              onPressed: _isEnabled ? () => debugPrint(data.toString()) : null,
              label: const Text(StreamFormConstants.save),
              icon: const Icon(Icons.save),
            );
          },
        ),
      ],
    );
  }
}
