part of 'product_group_cubit.dart';

enum ProductGroupPageStatus { initial, loading, success, failure }

class ProductGroupPageState extends Equatable {
  const ProductGroupPageState(
      {this.status = ProductGroupPageStatus.initial,
      this.groups = const [],
      this.failureMessage,
      this.loading = false});

  ProductGroupPageState copyWith({
    ProductGroupPageStatus? status,
    List<ProductGroup>? groups,
    String? failureMessage,
    bool? loading,
  }) {
    return ProductGroupPageState(
        status: status ?? this.status,
        loading: loading ?? this.loading,
        failureMessage: failureMessage ?? this.failureMessage,
        groups: groups ?? this.groups);
  }

  final ProductGroupPageStatus status;
  final List<ProductGroup> groups;
  final String? failureMessage;
  final bool loading;

  @override
  List<Object?> get props => [
        status,
        groups,
        failureMessage,
        loading,
      ];
}
