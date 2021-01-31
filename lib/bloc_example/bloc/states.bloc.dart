import 'package:experiments_with_web/app_level/utilities/bloc/bloc_event_state.component.dart';

import 'package:flutter/foundation.dart';

enum States {
  noTerm,
  fetching,
  error,
}

@immutable
class SearchState extends BlocState {
  SearchState({
    this.state,
  });

  final States state;

  factory SearchState.noTerm() {
    return SearchState(state: States.noTerm);
  }

  SearchState copyWith() {
    return SearchState();
  }

  factory SearchState.fetching() {
    return SearchState(state: States.fetching);
  }

  factory SearchState.error() {
    return SearchState(state: States.error);
  }
}
