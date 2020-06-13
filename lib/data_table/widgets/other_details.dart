import 'package:experiments_with_web/data_table/models/user_model.dart';
import 'package:flutter/material.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({Key key, @required this.data})
      : assert(data != null),
        super(key: key);

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    //

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(),
      ],
    );
  }
}
