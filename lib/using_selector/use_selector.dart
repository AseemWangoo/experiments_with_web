import 'package:experiments_with_web/app_level/widgets/desktop/centered_form.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_input_field.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

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
    //

    return Consumer<UserData>(
      builder: (_, userData, child) {
        //
        debugPrint('Entire form building 1️⃣ ');
        return CenteredForm(
          children: [
            // DEMO TO SHOW CONSUMER
            CustomInputField(
              onChanged: (val) => userData.name = val,
              hintText: SelectorsConstants.field1InputHint,
              labelText: SelectorsConstants.field1Hint,
            ),

            CustomInputField(
              onChanged: (val) => userData.age = int.tryParse(val),
              hintText: SelectorsConstants.field2InputHint,
              labelText: SelectorsConstants.field2Hint,
            ),

            _WatchSelector(),

            _ListenSelector(),
          ],
        );
      },
    );
  }
}

class _WatchSelector extends StatelessWidget {
  const _WatchSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _model = Provider.of<UserData>(context, listen: false);
    final _email =
        context.select<UserData, String>((model) => model.emailAddress);

    debugPrint('Hiii');

    return CustomInputField(
      onChanged: (val) {
        _model.emailAddress = val;
      },
      hintText: SelectorsConstants.field3InputHint,
      labelText: SelectorsConstants.field3Hint,
    );
  }
}

class _ListenSelector extends StatelessWidget {
  const _ListenSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Selector<UserData, Tuple2<String, int>>(
      builder: (_, data, __) {
        return Text('Name : ${data.item1} >>> Age : ${data.item2}');
      },
      selector: (_, userData) => Tuple2(userData.name, userData.age),
    );
  }
}
