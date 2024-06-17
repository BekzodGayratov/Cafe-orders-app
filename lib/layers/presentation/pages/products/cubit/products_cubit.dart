import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:paloma365_task/layers/domain/entity/product.dart';
import 'package:paloma365_task/layers/domain/usecase/get_product_by_group_id.dart';

part 'products_state.dart';

class ProductsPageCubit extends Cubit<ProductsPageState> {
  ProductsPageCubit({required GetProductsByGroupId getProductsByGroupId})
      : _getProductsByGroupId = getProductsByGroupId,
        super(const ProductsPageState());

  final GetProductsByGroupId _getProductsByGroupId;

  Future<void> getProductGroups(int id) async {
    emit(state.copyWith(status: ProductsPageStatus.loading));
    try {
      final products = await _getProductsByGroupId(id);
      emit(state.copyWith(
          products: products, status: ProductsPageStatus.success));
    } catch (e) {
      emit(state.copyWith(
          failureMessage: e.toString(), status: ProductsPageStatus.failure));
    }
  }
}
