class RequestResponse<T> {
  final bool success;
  final String? error;
  final T? data;

  const RequestResponse(this.success, {this.error, this.data});

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return RequestResponse(
      json['success'] as bool,
      error: json['error'] as String?,
      data: json['data'] as T?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'error': error, 'data': data};
  }
}
