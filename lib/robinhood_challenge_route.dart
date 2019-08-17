
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'robinhood_challenge_form.dart';

class RobinhoodChallengeRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Code')
      ),
      body: RobinhoodChallengeForm()
    );
  }
}