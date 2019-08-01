import 'package:http/http.dart' as http;
import 'dart:convert';

class RobinhoodLoginFlow {
  String deviceToken, username, password;
  String urlToScrubDeviceToken = 'https://robinhood.com/login';
  String oauthUrl = 'https://api.robinhood.com/oauth2/token/';
  String clientId = 'c82SH0WZOsabOXGP2sxqcj34FxkvfnWRZBKlBjFS';

  Map<String, dynamic> body;
  Map<String, String> headers;


  RobinhoodLoginFlow({
    this.username,
    this.password
  }) {

    this.body = {
    'client_id': this.clientId,
    'expires_in': 86400,
    'grant_type': 'password',
    'scope': 'internal',
    };

    this.headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Robinhood-API-Version': '1.280.0'
    };

  }

  initiate()
  {
    this.deviceTokenFuture()
      .then(this.initialChallengeFuture)
      .then(this.secondaryChallengeFuture);
  }


  Future<String> deviceTokenFuture() {
    if (this.deviceToken != null) {
      return new Future.value(this.deviceToken);
    }

    var future = http.get(this.urlToScrubDeviceToken);

    return future.then((response) {
      var str = response.body;

      RegExp exp = new RegExp(
        r'clientId: \"([0-9a-z-]+)\"',
        caseSensitive: true,
      );

      var match = exp.firstMatch(str);
      this.deviceToken = match.group(1);
      return this.deviceToken;
    });
  }


  Future<int> initialChallengeFuture(deviceToken) {

    this.body['device_token'] = this.deviceToken;
    this.body['username'] = this.username;
    this.body['password'] = 'ljsldkjflsdjfklsdjf';

    var encodedBody = jsonEncode(body);

    print(encodedBody);


    var future = http.post(
      this.oauthUrl,
      headers: this.headers,
      body: encodedBody
    );

    return future.then((response) {
      print(response.body);
      if (response.statusCode == 400) {
        return response.statusCode;
      }
      else {
        throw 0;
      }
    });
  }

  
  Future<dynamic> secondaryChallengeFuture(int i) {

    this.body['challenge_type'] = 'sms';

    var encodedBody = jsonEncode(body);

    var future = http.post(
      this.oauthUrl,
      headers: this.headers,
      body: encodedBody
    );

    return future.then((response) {
      print(response.body);
      if (response.statusCode == 400) {
        return response.statusCode;
      }
      else {
        throw 0;
      }
    });

  }
}

