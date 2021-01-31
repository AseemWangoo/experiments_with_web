import 'package:experiments_with_web/app_level/utilities/bloc/bloc_event_state.component.dart';

import 'package:flutter/foundation.dart';

@immutable
class SearchState extends BlocState {
  SearchState();

  factory SearchState.noTerm() {
    return SearchState();
  }

  SearchState copyWith() {
    return SearchState();
  }
}
