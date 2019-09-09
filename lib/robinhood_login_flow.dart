import 'package:http/http.dart' as http;
import 'dart:convert';

class RobinhoodLoginFlow {
  String deviceToken, username, password;
  String urlToScrubDeviceToken = 'https://robinhood.com/login';
  String oauthUrl = 'https://api.robinhood.com/oauth2/token/';
  String clientId = 'c82SH0WZOsabOXGP2sxqcj34FxkvfnWRZBKlBjFS';
  String challengeId = '';

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
    return this.deviceTokenFuture()
      .then(this.oAuth1Future)
      .then(this.oAuth2Future);
  }

  provideCodeFromRobinhood(String code)
  {
    if (challengeId.isEmpty) {
      throw "there is no challenge id";
    }

    return this.challengeFuture(code);
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


  Future<int> oAuth1Future(deviceToken) {

    this.body['device_token'] = this.deviceToken;
    this.body['username'] = this.username;
    this.body['password'] = this.password;

    var encodedBody = jsonEncode(body);

    var future = http.post(
      this.oauthUrl,
      headers: this.headers,
      body: encodedBody
    );

    return future.then((response) {
      return response.statusCode;
    });
  }

  
  Future<dynamic> oAuth2Future(int i) {

    this.body['challenge_type'] = 'sms';

    var encodedBody = jsonEncode(body);

    var future = http.post(
      this.oauthUrl,
      headers: this.headers,
      body: encodedBody
    );

    return future.then((response) {
      Map<String, dynamic> responseMap = jsonDecode(response.body);

      this.challengeId = responseMap['challenge']['id'];

      return response.statusCode;
    });
  }


  Future<int> challengeFuture(String code) {
    String url = 'https://api.robinhood.com/challenge/'
      + challengeId + '/respond/';

    var body = {
      'response': code
    };

    var encodedBody = jsonEncode(body);

    var future = http.post(
      url,
      headers: this.headers,
      body: encodedBody
    );

    return future.then((response) {
      print(response.body);
      return response.statusCode;
    });
  }
}

