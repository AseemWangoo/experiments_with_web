import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/styles/themes.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart'
    show LengthLimitingTextInputFormatter, TextInputFormatter;

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key key,
    @required this.onChanged,
    this.autoFillHints,
    this.autofocus = false,
    this.customErrorWidget,
    this.errorText = 'This field cannot be blank',
    this.focusNode,
    this.hintText = 'Some hint here',
    this.initialValue = '',
    this.isFieldEnabled = true,
    this.keyboardType = TextInputType.text,
    this.listOfInputFormatters,
    this.labelText = 'Label',
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 80,
    this.showError = false,
    this.textCapitalization = TextCapitalization.none,
    this.textController,
  })  : assert(onChanged != null),
        super(key: key);

  final bool autofocus;
  final List<String> autoFillHints;
  final ValueChanged<String> onChanged;
  final String errorText;
  final String hintText;
  final FocusNode focusNode;
  final bool isFieldEnabled;
  final String initialValue;
  final List<TextInputFormatter> listOfInputFormatters;
  final String labelText;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final bool showError;
  final Widget customErrorWidget;
  final TextEditingController textController;

  // ------------------------------------ INTERNALS ------------------------------------

  static final _appTheme = AppTheme.darkTheme;

  String get _hintText => hintText;
  String get _initValue => initialValue;
  String get _labelText => labelText;
  FocusNode get _focusNode => _checkFocusNode;

  FocusNode get _checkFocusNode => focusNode;

  List<TextInputFormatter> get _inputFormatters => _checkForInputFormatters;

  List<TextInputFormatter> get _checkForInputFormatters {
    final _defaultFormatter = LengthLimitingTextInputFormatter(maxLength);

    return listOfInputFormatters ?? [_defaultFormatter];
  }

  List<String> get _autoFillHints => _checkAutoFillHints;

  List<String> get _checkAutoFillHints {
    final _defaultAutoFillHint = <String>[];

    return autoFillHints ?? _defaultAutoFillHint;
  }

  Widget get _errorWidget => _checkErrorWidget;

  Widget get _checkErrorWidget {
    if (showError && customErrorWidget != null) {
      return customErrorWidget;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 4.0),
      child: Text(
        errorText,
        textAlign: TextAlign.left,
        style: CustomInputField._appTheme.textTheme.bodyText2.c(Colors.red),
      ),
    );
  }

  TextStyle get _labelStyle => CustomInputField._appTheme.textTheme.bodyText2
      .size(16.0)
      .c(Colors.black87);

  TextStyle get _hintStyle =>
      CustomInputField._appTheme.textTheme.bodyText2.size(16.0).c(Colors.grey);

  TextStyle get _customInputFieldStyle =>
      CustomInputField._appTheme.textTheme.bodyText1.size(18.0);

  InputDecoration get _inputDecoration => InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        hintText: _hintText,
        hintStyle: _hintStyle,
        labelText: _labelText,
        labelStyle: _labelStyle,
      );

  ToolbarOptions get _toolBarOptions => const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      );

  TextEditingController get _widgetTextController => _textController;
  TextEditingController get _textController {
    if (textController != null) {
      return textController;
    }
    return null;
  }

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget._initValue);
  }

  @override
  Widget build(BuildContext context) {
    //

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          autofocus: widget.autofocus,
          autofillHints: widget._autoFillHints,
          controller: widget._widgetTextController ?? _textController,
          cursorColor: Colors.black,
          cursorWidth: 1.0,
          decoration: widget._inputDecoration,
          enabled: widget.isFieldEnabled,
          focusNode: widget._focusNode,
          inputFormatters: widget._inputFormatters,
          keyboardAppearance: Brightness.light,
          keyboardType: widget.keyboardType,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          style: widget._customInputFieldStyle,
          textCapitalization: widget.textCapitalization,
          textInputAction: TextInputAction.done,
          toolbarOptions: widget._toolBarOptions,
        ),
        if (widget.showError) widget._errorWidget,
      ],
    );
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }
}

// NOTE : YOU CAN IMPLEMENT YOUR OWN CUSTOM FORMATTERS...

// REFER ARTICLE : https://medium.com/@rubensdemelo/flutter-formatting-textfield-with-textinputformatter-6caba78668e5
