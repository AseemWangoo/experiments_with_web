import 'package:experiments_with_web/app_level/utilities/bloc/bloc_event_state.component.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

typedef AsyncBlocBuilder<BlocState> = Widget Function(
    BuildContext context, BlocState state);

class BlocBuilderProvider<BlocEvent, BlocState> extends StatelessWidget {
  /// Acts like a StreamBuilder
  ///
  /// {@tool sample}
  ///
  /// This snippet shows how to use a [BlocBuilderProvider].
  ///
  /// ```dart
  /// final bloc = BlocProvider.of<TrackActionsBloc>(context);
  ///
  /// BlocBuilderProvider<TrackActionsEvent, TrackActionsState>(
  ///   bloc: bloc,
  ///   builder: (context, state) {
  ///     switch (state.state) {
  ///       case States.loading:
  ///         return const _Internal1();
  ///         break;
  ///       case States.ready:
  ///         return const _Internal2();
  ///         break;
  ///       case States.finished:
  ///         WidgetsBinding.instance.addPostFrameCallback((_) {
  ///           final newRoute = MaterialPageRoute(
  ///             builder: (BuildContext context) => _NewPage(bloc: bloc),
  ///           );
  ///           Navigator.of(context).push(newRoute);
  ///         });
  ///         // return const _Internal3();
  ///         break;
  ///     }
  ///     return const SizedBox();
  ///   },
  /// );
  /// ```
  /// {@end-tool}
  const BlocBuilderProvider({
    Key key,
    @required this.bloc,
    @required this.builder,
  })  : assert(builder != null),
        assert(bloc != null),
        super(key: key);

  final BlocEventStateBase<BlocEvent, BlocState> bloc;
  final AsyncBlocBuilder<BlocState> builder;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<BlocState>.value(
      initialData: bloc.initState,
      value: bloc.state,
      child: Consumer<BlocState>(
        builder: (context, state, _) => builder(context, state),
      ),
    );
  }
}
