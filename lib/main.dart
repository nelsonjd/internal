import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class Internal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Internal')),
      body: new SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 60.0),
            Text('Welcome to Internal®.'),
            Text('We never store your data on our servers. it only lives in this session and it\'s always encrypted.'),
            SizedBox(height: 15.0),
            UserNameFormField(),
            SizedBox(height: 15.0),
            PasswordFormField(),
          ],
        )
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
