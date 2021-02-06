import 'package:experiments_with_web/app_level/components/stream/custom_stream_builder.component.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/bloc_example/bloc/search.bloc.dart';
import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';
import 'package:experiments_with_web/bloc_example/utilities/strings.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart' show Provider;

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
      child: CustomStreamBuilder<SearchState>(
        builder: (context, model) {
          return _Internal();
        },
        initialData: SearchNoTerm(),
        stream: searchBloc.state,
      ),
      // child: StreamProvider<SearchState>.value(
      //   initialData: SearchNoTerm(),
      //   value: searchBloc.state,
      //   // updateShouldNotify: (_, __) => true,
      //   child: _Internal(),
      // ),
      // child: StreamBuilder<SearchState>(
      //   stream: searchBloc.state,
      //   initialData: SearchNoTerm(),
      //   builder: (_, snapshot) {
      //     final state = snapshot.data;

      //     print('>>> S $state');

      //     return _Internal();
      //   },
      // ),
    );
  }
}

class _Internal extends StatelessWidget {
  const _Internal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = locator<SearchBloc>();
    final state = Provider.of<SearchState>(context);
    print('>>>>>STATE ${state.state}');

    if (state.state == States.populated) {
      final results = (state as SearchPopulated).result;

      print(results.items.first.url);
    }

    return Center(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Github...',
        ),
        style: TextStyle(
          fontSize: 36.0,
          decoration: TextDecoration.none,
        ),
        onChanged: bloc.onTextChanged.add,
      ),
    );
  }
}
