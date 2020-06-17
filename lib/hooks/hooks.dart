import 'package:experiments_with_web/app_level/styles/themes.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/centered_form.dart';
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
    debugPrint('IM BUILDING');

    final _model = useMemoized(
      () => Suggestion(personName: 'as'),
    );

    debugPrint('IM ${_model.personName}');

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
              final _state = useState('');
              return CustomInputField(
                onChanged: (val) {
                  debugPrint('>>> $val');
                  _state.value = val;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
