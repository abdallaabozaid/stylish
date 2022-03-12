import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/config/enums.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<SelectedCategoryState> {
  CategoriesCubit() : super(const SelectedCategoryState(CategoryName.shirt));

  void changeCategory(CategoryName categoryName) {
    emit(SelectedCategoryState(categoryName));
  }
}
