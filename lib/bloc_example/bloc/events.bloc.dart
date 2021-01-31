import 'package:experiments_with_web/app_level/utilities/bloc/bloc_event_state.component.dart';

import 'package:flutter/foundation.dart';

@immutable
class SearchEvent extends BlocEvent {
  SearchEvent();

  SearchEvent copyWith() {
    return SearchEvent();
  }
}
