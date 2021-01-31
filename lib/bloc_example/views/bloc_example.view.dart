import 'package:experiments_with_web/app_level/components/bloc_builder/bloc_builder.component.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_input_field.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/bloc_example/bloc/events.bloc.dart';
import 'package:experiments_with_web/bloc_example/bloc/search.bloc.dart';
import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';
import 'package:experiments_with_web/bloc_example/utilities/strings.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';

class BlocExampleScreen extends StatefulWidget {
  const BlocExampleScreen({Key key}) : super(key: key);

  @override
  _BlocExampleScreenState createState() => _BlocExampleScreenState();
}

class _BlocExampleScreenState extends State<BlocExampleScreen> {
  SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    searchBloc = locator<SearchBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleText: BlocExampleStrings.title,
      enableDarkMode: true,
      child: BlocBuilderProvider<SearchEvent, SearchState>(
        bloc: searchBloc,
        builder: (_, state) {
          print('STATE is ${state.state}');

          return const Center(child: _Internal());
        },
      ),
    );
  }
}

class _Internal extends StatelessWidget {
  const _Internal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = locator<SearchBloc>();

    return CustomInputField(
      onChanged: (val) {
        bloc.emitEvent(
          SearchEvent(eventType: Events.typing, searchTerm: val),
        );
      },
    );
  }
}
