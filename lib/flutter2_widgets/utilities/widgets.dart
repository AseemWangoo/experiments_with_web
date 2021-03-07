import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/link.dart';

// Link

class LinkerDemo extends StatelessWidget {
  const LinkerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse('https://flatteredwithflutter.com'),
      builder: (_, followLink) {
        return ElevatedButton(
          onPressed: followLink,
          child: Text('Click me!!'),
        );
      },
    );
  }
}

// CupertinoSearch

class CupertinoSearchDemo extends StatefulWidget {
  @override
  _CupertinoSearchDemoState createState() => _CupertinoSearchDemoState();
}

class _CupertinoSearchDemoState extends State<CupertinoSearchDemo> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onChanged: (value) {
        print('Search text: ' + value);
      },
      onSubmitted: (value) {
        print('Search Submitted text: ' + value);
      },
      suffixIcon: const Icon(Icons.search),
    );
  }
}

// CupertinoForm

class CupertinoFormDemo extends StatefulWidget {
  CupertinoFormDemo({Key key}) : super(key: key);

  @override
  _CupertinoFormDemoState createState() => _CupertinoFormDemoState();
}

class _CupertinoFormDemoState extends State<CupertinoFormDemo> {
  bool toggleValue = false;
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            CupertinoFormSection(
              header: Text('CupertinoFormRow'),
              children: <Widget>[
                CupertinoFormRow(
                  child: CupertinoSwitch(
                    value: toggleValue,
                    onChanged: (value) {
                      setState(() => toggleValue = value);
                    },
                  ),
                  prefix: Text('Toggle'),
                  helper: Text('Slide me'),
                  error: toggleValue ? null : Text('Not slided'),
                ),
              ],
            ),
            CupertinoFormSection(
              header: Text('CupertinoTextFormFieldRow '),
              children: <Widget>[
                CupertinoTextFormFieldRow(
                  controller: _textController,
                  onChanged: (value) {
                    print('TextFormField text: ' + value);
                  },
                  onFieldSubmitted: (value) {
                    print('TextFormField Submitted text: ' + value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ScaffoldMessenger

class ScaffoldMessengerDemo extends StatelessWidget {
  const ScaffoldMessengerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add_alert),
      onPressed: () {
        final messenger = ScaffoldMessenger.of(context);

        messenger.showSnackBar(
          SnackBar(content: Text('Hey Snackbar!')),
        );
      },
    );
  }
}

// RawAutocomplete

class RawAutocompleteDemo extends StatefulWidget {
  RawAutocompleteDemo({Key key}) : super(key: key);

  @override
  _RawAutocompleteDemoState createState() => _RawAutocompleteDemoState();
}

class _RawAutocompleteDemoState extends State<RawAutocompleteDemo> {
  final _formKey = GlobalKey<FormState>();

  String _autocompleteSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RawAutocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return tempOptions.where((String option) => option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (String selection) {
                    setState(() => _autocompleteSelection = selection);
                  },
                  fieldViewBuilder: (_,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      onFieldSubmitted: (String value) => onFieldSubmitted(),
                      validator: (String value) {
                        if (!tempOptions.contains(value)) {
                          return 'No selection from suggestions';
                        }
                        return null;
                      },
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: SizedBox(
                          height: 200.0,
                          child: ListView(
                            children: options
                                .map(
                                  (String option) => GestureDetector(
                                    onTap: () => onSelected(option),
                                    child: ListTile(
                                      title: Card(child: Text(option)),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Your Submission'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                  'RawAutocomplete: "$_autocompleteSelection"'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> tempOptions = <String>[
  'Flutter',
  '2',
  'Releases',
];
