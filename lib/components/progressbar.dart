import 'dart:io';

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      child: Row(
        children: [
          Text('Loading'),
          CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
