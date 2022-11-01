part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductsFetched extends ProductState {
  final String message;
  ProductsFetched(this.message);
}

/// this state emit if error occure when fetch data from backend
class ProductsError extends ProductState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}
