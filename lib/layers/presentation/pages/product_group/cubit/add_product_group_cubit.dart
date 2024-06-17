import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/usecase/add_product_group.dart';

part 'add_product_group_state.dart';

class AddProductGroupCubit extends Cubit<AddProductGroupPageState> {
  AddProductGroupCubit({required AddProductGroup addProductGroup})
      : _addProductGroup = addProductGroup,
        super(const AddProductGroupPageState());

  final AddProductGroup _addProductGroup;

  Future<void> addProductGroup(ProductGroup productGroup) async {
    emit(state.copyWith(status: AddProductGroupPageStatus.loading));
    try {
      await _addProductGroup(productGroup);
      emit(state.copyWith(status: AddProductGroupPageStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: AddProductGroupPageStatus.failure,
          failureMessage: e.toString()));
    }
  }
}
