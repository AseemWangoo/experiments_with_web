import 'package:experiments_with_web/app_level/styles/colors.dart';
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

    return CenteredForm(
      children: [
        CustomInputField(
          onChanged: (val) {
            context.read<UserData>().name = val;
          },
          hintText: SelectorsConstants.field1InputHint,
          labelText: SelectorsConstants.field1Hint,
        ),

        //
        CustomInputField(
          onChanged: (val) {
            context.read<UserData>().age = int.tryParse(val);
          },
          hintText: SelectorsConstants.field2InputHint,
          labelText: SelectorsConstants.field2Hint,
        ),
        //
        _NameAgeSelector(),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Divider(
            color: AppColors.brandColor,
            height: 10.0,
            thickness: 5.0,
          ),
        ),

        CustomInputField(
          onChanged: (val) {
            context.read<UserData>().emailAddress = val;
          },
          hintText: SelectorsConstants.field3InputHint,
          labelText: SelectorsConstants.field3Hint,
        ),
        _EmailWatchSelector(),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Divider(
            color: AppColors.brandColor,
            height: 10.0,
            thickness: 5.0,
          ),
        ),

        _AllFieldsWatchSelector(),

        const Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: Text(SelectorsConstants.tip),
        ),
      ],
    );
  }
}

class _EmailWatchSelector extends StatelessWidget {
  const _EmailWatchSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _email =
        context.select<UserData, String>((model) => model.emailAddress);

    debugPrint('Email Watching 3️⃣ ');

    return Text('(Listen to Email) Email : $_email');
  }
}

class _NameAgeSelector extends StatelessWidget {
  const _NameAgeSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Selector<UserData, Tuple2<String, int>>(
      builder: (_, data, __) {
        print('Name or age changed 1️⃣  2️⃣ ');

        return Text(
            '(Listening to Name & Age) Name : ${data.item1} >>> Age : ${data.item2}');
      },
      selector: (_, userData) => Tuple2(userData.name, userData.age),
    );
  }
}

class _AllFieldsWatchSelector extends StatelessWidget {
  const _AllFieldsWatchSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Consumer<UserData>(
      builder: (_, data, __) {
        return Text(
          '(Listening to all) Name : ${data.name} >>> Age : ${data.age} >>> Email : ${data.emailAddress}',
        );
      },
    );
  }
}
