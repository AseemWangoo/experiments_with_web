import 'package:experiments_with_web/app_level/utilities/bloc/bloc_event_state.component.dart';
import 'package:experiments_with_web/bloc_example/bloc/events.bloc.dart';
import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';

class SearchBloc extends BlocEventStateBase<SearchEvent, SearchState> {
  SearchBloc() : super(initState: SearchState.noTerm());

  @override
  Stream<SearchState> eventHandler(
    SearchEvent event,
    SearchState currentState,
  ) async* {
    throw UnimplementedError();
  }
}
