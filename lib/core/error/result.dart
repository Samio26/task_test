import 'package:tesstt_task/core/error/failures.dart';

class Result<T> {
  final T? value;

  final Failure? failure;

  Result.success(this.value) : failure = null;

  Result.failure(this.failure) : value = null;

  bool get isSuccess => value != null;

  bool get isFailure => failure != null;

  void when({
    required void Function(T value) success,
    required void Function(Failure failure) failure,
  }) {
    if (isSuccess) {
      success(value as T);
    } else if (isFailure) {
      failure(this.failure as Failure);
    }
  }
}
