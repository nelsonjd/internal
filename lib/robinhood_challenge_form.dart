import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:internal/robinhood_login_flow.dart';

class RobinhoodChallengeForm extends StatefulWidget {

  RobinhoodLoginFlow flow;

  RobinhoodChallengeForm({this.flow});

  @override
  RobinhoodChallengeFormState createState() {
    return RobinhoodChallengeFormState(flow: this.flow);
  }
}


class RobinhoodChallengeFormState extends State<RobinhoodChallengeForm> {
  final _formKey = GlobalKey<FormState>();

  final challengeCodeCtrl = TextEditingController();

  RobinhoodLoginFlow flow;

  RobinhoodChallengeFormState({this.flow});

  @override
  void dispose() {
    challengeCodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 60.0),
          TextFormField(
            controller: challengeCodeCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Cannot be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              labelText: 'Enter Your Code From Robinhood'
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('processing data')));
                }

                var code = challengeCodeCtrl.text;

                this.flow.provideCodeFromRobinhood(code);


              },
              child: Text('Send To Robinhood'),
            )
          )
        ],
      )
    );
  }
}