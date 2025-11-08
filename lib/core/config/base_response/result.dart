sealed class Result<T> {
  const Result();
  void when({
    required Function(T? data) success,
    required Function(Exception? exception) error,
  }) {
    if (this is Success<T>) {
      success((this as Success<T>).data);
    } else if (this is Error<T>) {
      error((this as Error<T>).exception);
    }
    throw Exception("Unhandled ApiResult case");
  }
}

class Success<T> extends Result<T> {
  final T? data;
  const Success({this.data});
}

class Error<T> extends Result<T> {
  final Exception? exception;
  const Error({this.exception});
}
