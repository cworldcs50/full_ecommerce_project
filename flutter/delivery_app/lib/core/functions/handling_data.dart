import '../constants/enums/request_status.dart';

RequestStatus handlingData(dynamic response) =>
    response is RequestStatus ? response : RequestStatus.success;
