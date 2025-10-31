enum StateType { initial, loading, success, error }

// changed from abstract class to class to make it possible to be initialized
class BaseState<T> {
  final StateType state;
  final T? data;
  final Exception? exception;

  // removing the normal constructor

  // create custom constructors for each state type to make it more readable and simplify the code inside the cubit
  /* for example instead of :
     emit(
      state.copyWith(
            exampleState: BaseState<User>(
              isLoading: false,
              data: res.data,
        ),
      ),
    );

    we do this : 
     emit(state.copyWith(exampleState: BaseState.success(data)));

  */
  const BaseState.initial()
    : state = StateType.initial,
      data = null,
      exception = null;

  const BaseState.loading()
    : state = StateType.loading,
      data = null,
      exception = null;

  const BaseState.success(this.data)
    : state = StateType.success,
      exception = null;

  const BaseState.error(this.exception) : state = StateType.error, data = null;
  const BaseState.all({
    required this.exception,
    required this.data,
    required this.state,
  });

  // added when method to make the code more readable in the UI
  R when<R>({
    required R Function(T data) success,
    required R Function() loading,
    required R Function(Exception exception) error,
    required R Function() initial,
  }) {
    return switch (state) {
      StateType.initial => initial(),
      StateType.loading => loading(),
      StateType.success => success(data!),
      StateType.error => error(exception!),
    };
  }

  @override
  String toString() {
    return 'BaseState(state:$state,${data != null ? ',data: $data, ' : ''}${exception != null ? ',exception: $exception' : ''})';
  }
}
