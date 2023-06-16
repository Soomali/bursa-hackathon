enum RequestStatus { accepted, rejected, waiting }

extension MyRequestExtension on RequestStatus {
  static RequestStatus fromJson(String json) {
    return RequestStatus.values.firstWhere(
        (e) => e.toString() == 'RequestStatus.${json.toLowerCase()}');
  }
}
