import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'robinhood_login_form.dart';

class Internal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Internal')),
      body: new RobinhoodLoginForm(
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Internal',
      home: Internal()
    )
  );
}
