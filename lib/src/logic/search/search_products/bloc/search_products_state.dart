part of 'search_products_bloc.dart';

class SearchProductsState extends Equatable {
  final List<ProductModel> results;
  final String searchWord;
  const SearchProductsState({
    required this.results,
    required this.searchWord,
  });
  @override
  List<Object> get props => [results, searchWord];
}



// class SearchProductsNoResults extends SearchProductsState {}

