part of 'categories_cubit.dart';

class SelectedCategoryState extends Equatable {
  const SelectedCategoryState(
    this.categoryName,
  );

  final CategoryName categoryName;

  @override
  List<Object> get props => [categoryName];
}

// class SelectedCategoryState extends CategoriesState {}
