import 'package:sports_app/core/model/response/base_response.dart';

class AccessTokenResponse extends BaseResponse {
  String? accessToken;
  AccessTokenResponse(succes, {error, this.accessToken})
    : super(succes, error: error);

  /// Named Constructor
  AccessTokenResponse.fromJson(json) : super.fromJson(json) {
    this.accessToken = json['access_token'];
    print("Accesstoken => ${this.accessToken}");
  }
}
