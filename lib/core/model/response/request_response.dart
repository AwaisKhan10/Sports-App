class RequestResponse {
  late bool success;
  String? error;
  late var data;

  RequestResponse(this.success, {this.error, this.data});

  RequestResponse.fromJson(json) {
    try {
      this.data = json;
      this.success = json.data["success"];
      this.error = json.data['error'];
    } catch (e) {
      print("errorRequestResponse => $e");
    }
  }

  toJson() {
    return {'success': this.success, 'error': this.error, 'body': this.data};
  }
}
