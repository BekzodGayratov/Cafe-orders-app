part of 'add_product_group_cubit.dart';

enum AddProductGroupPageStatus { initial, loading, success, failure }

class AddProductGroupPageState extends Equatable {
  const AddProductGroupPageState(
      {this.status = AddProductGroupPageStatus.initial,
      this.failureMessage,
      this.loading = false});

  AddProductGroupPageState copyWith({
    AddProductGroupPageStatus? status,
    String? failureMessage,
    bool? loading,
  }) {
    return AddProductGroupPageState(
      status: status ?? this.status,
      loading: loading ?? this.loading,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  final AddProductGroupPageStatus status;
  final String? failureMessage;
  final bool loading;

  @override
  List<Object?> get props => [
        status,
        failureMessage,
        loading,
      ];
}
