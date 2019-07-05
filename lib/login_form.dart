import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 60.0),
          Text('Welcome to Internal®.'),
          Text(
            'We never store your credentials on our servers. It is sent using encrypted protocols.'),
          SizedBox(height: 15.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Cannot be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              labelText: 'Robinhood Username',
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Cannot be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              labelText: 'Robinhood Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('processing data')));
                }
              },
              child: Text('Send To Robinhood')
            ),
          )
        ],
      )
    );
  }
}

