
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:internal/robinhood_login_flow.dart';

import 'robinhood_challenge_form.dart';

class RobinhoodChallengeRoute extends StatelessWidget {

  final RobinhoodLoginFlow flow;

  RobinhoodChallengeRoute({Key key, @required this.flow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Code')
      ),
      body: RobinhoodChallengeForm(flow: flow)
    );
  }
}