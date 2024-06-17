part of 'products_cubit.dart';

enum ProductsPageStatus { initial, loading, success, failure }

class ProductsPageState extends Equatable {
  const ProductsPageState(
      {this.status = ProductsPageStatus.initial,
      this.products = const [],
      this.failureMessage,
      this.loading = false});

  ProductsPageState copyWith({
    ProductsPageStatus? status,
    List<Product>? products,
    String? failureMessage,
    bool? loading,
  }) {
    return ProductsPageState(
        status: status ?? this.status,
        loading: loading ?? this.loading,
        failureMessage: failureMessage ?? this.failureMessage,
        products: products ?? this.products);
  }

  final ProductsPageStatus status;
  final List<Product> products;
  final String? failureMessage;
  final bool loading;

  @override
  List<Object?> get props => [
        status,
        products,
        failureMessage,
        loading,
      ];
}
