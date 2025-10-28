enum StateType { initial, loading, success, error }

abstract class BaseState<T> {
  final StateType state;
  final T? data;
  final Exception? exception;
  BaseState({this.state = StateType.initial, this.data, this.exception});

  @override
  String toString() {
    return 'BaseState(state:$state,${data != null ? ',data: $data, ' : ''}${exception != null ? ',exception: $exception' : ''})';
  }
}
