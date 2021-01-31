import 'package:experiments_with_web/app_level/utilities/bloc/bloc_event_state.component.dart';

import 'package:flutter/foundation.dart';

enum Events {
  init,
  typing,
}

@immutable
class SearchEvent extends BlocEvent {
  SearchEvent({
    this.eventType,
    this.searchTerm,
  });

  final Events eventType;
  final String searchTerm;

  SearchEvent copyWith({
    Events event,
    String searchTerm,
  }) {
    return SearchEvent(
      eventType: event ?? Events.init,
      searchTerm: searchTerm ?? '',
    );
  }
}
