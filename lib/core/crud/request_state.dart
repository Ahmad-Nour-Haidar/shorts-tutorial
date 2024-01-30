abstract class RequestState {
  final String message;

  RequestState(this.message);
}

final class NotFoundState extends RequestState {
  NotFoundState({String? message}) : super(message ?? 'Not Found');
}

final class UnauthorizedState extends RequestState {
  UnauthorizedState({String? message})
      : super(message ?? 'Unauthorized,No token provided');
}

final class NoContentState extends RequestState {
  NoContentState({String? message}) : super(message ?? 'No Content');
}

final class OfflineState extends RequestState {
  OfflineState({String? message}) : super(message ?? 'You are offline');
}

final class FailureState extends RequestState {
  FailureState({String? message})
      : super(message ?? 'FailureState, Some thing went wrong');
}

final class TimeoutState extends RequestState {
  TimeoutState({String? message}) : super(message ?? 'Timeout');
}
