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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          UserNameFormField(

          )
        ],
      ),
    );
  }
}


class UserNameFormField extends FormField<String> {
  UserNameFormField({
    bool autovalidate = false,
  }) : super (
    autovalidate: autovalidate,
    builder: (FormFieldState<String> state) {
      return TextField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'Robinhood Username',
        ),
      );
    }
  );
}


class PasswordFormField extends FormField<String> {
  PasswordFormField({
    bool autovalidate = false,
  }) : super(
    autovalidate: autovalidate,
    builder: (FormFieldState<String> state) {
      return TextField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'Robinhood Password',
        ),
      );
    }
  );
}