import 'package:firebase_core/firebase_core.dart';

abstract class DataState<T> {
  const DataState({this.data, this.error});

  final T? data;
  final FirebaseException? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(this.data) : super(data: data);

  final T data;
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(this.error) : super(error: error);

  final FirebaseException error;
}
