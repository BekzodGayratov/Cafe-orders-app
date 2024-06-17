import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/usecase/get_product_groups.dart';

part 'product_group_state.dart';

class ProductGroupCubit extends Cubit<ProductGroupPageState> {
  ProductGroupCubit({required GetProductGroups getProductGroups})
      : _getProductGroups = getProductGroups,
        super(const ProductGroupPageState());

  final GetProductGroups _getProductGroups;

  Future<void> getProductGroups() async {
    emit(state.copyWith(status: ProductGroupPageStatus.loading));
    try {
      final productGroups = await _getProductGroups();
      emit(state.copyWith(
          groups: productGroups, status: ProductGroupPageStatus.success));
    } catch (e) {
      emit(state.copyWith(
          failureMessage: e.toString(),
          status: ProductGroupPageStatus.failure));
    }
  }
}
