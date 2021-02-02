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

  SearchState copyWith() {
    return SearchState();
  }
}

class SearchNoTerm extends SearchState {
  SearchNoTerm() : super(state: States.noTerm);
}

class SearchFetching extends SearchState {
  SearchFetching() : super(state: States.fetching);
}

class SearchError extends SearchState {
  SearchError() : super(state: States.error);
}

// extension Statess on SearchState {
//   SearchState get noTerm {
//     return SearchNoTerm();
//   }
// }
