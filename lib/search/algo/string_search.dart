class StringSearch {
  StringSearch(this.input, this.searchTerm);

  /// Specify the input list.
  ///
  /// For instance,`['Hey', 'there']`
  final List<String> input;

  /// Search term should be of length 2 or more
  final String searchTerm;

  List<String> relevantResults() {
    // Search term should be of length 2 or more
    if (searchTerm.length < 2) {
      return [];
    }

    return input
        .where((item) => item.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}

// Phrase | Occurence | Cliched Result || Timestamp
// ----------------------------------------------
//    0   |    0     |        0       ||  DateTime
//    1   |    1     |        0       ||  DateTime
//    1   |    1     |        1       ||  DateTime
