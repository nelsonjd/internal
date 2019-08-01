import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'robinhood_login_flow.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

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
            controller: usernameCtrl,
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
            controller: passwordCtrl,
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

                var username = usernameCtrl.text;
                var password = passwordCtrl.text;

                var future = new RobinhoodLoginFlow(
                  username: username,
                  password: password
                ).initiate();

              },
              child: Text('Send To Robinhood')
            ),
          )
        ],
      )
    );
  }
}

