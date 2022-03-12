part of 'search_products_bloc.dart';

abstract class SearchProductsEvent extends Equatable {
  const SearchProductsEvent();

  @override
  List<Object> get props => [];
}

class Search extends SearchProductsEvent {
  final String searchWord;
  final SearchFiltersModel searchFilters;

  const Search({
    required this.searchWord,
    required this.searchFilters,
  });
}

class StartingSearch extends SearchProductsEvent {}

class EndingSearch extends SearchProductsEvent {}
