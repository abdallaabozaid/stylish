import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/src/data/model/product_model.dart';
import 'package:stylish/src/data/model/search_filters_model.dart';
import 'package:stylish/src/data/repo/dummy_data_repo.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  List<ProductModel> results;
  String searchWord;

  SearchProductsBloc(this.results, this.searchWord)
      : super(SearchProductsState(results: results, searchWord: searchWord)) {
    on<SearchProductsEvent>(
      (event, emit) {
        if (event is Search) {
          results = _applyFilters(
              event.searchFilters, event.searchWord.toLowerCase());
          searchWord = event.searchWord;
          emit(
            SearchProductsState(results: results, searchWord: searchWord),
          );
        }
      },
    );
  }

  List<ProductModel> _applyFilters(
      SearchFiltersModel searchFilters, String searchWord) {
    final List<ProductModel>? productInSelectedSection =
        DummyDataRepo.allProducts[searchFilters.sectionName];

    final List<ProductModel> productsWithSearchWord = productInSelectedSection!
        .where(
            (element) => element.productName.toLowerCase().contains(searchWord))
        .toList();

    if (productsWithSearchWord.isEmpty) {
      return [];
    } else {
      final List<ProductModel> productsInselectedPriceRange =
          productsWithSearchWord
              .where((element) =>
                  element.price > searchFilters.priceRanegValue.start &&
                  element.price < searchFilters.priceRanegValue.end)
              .toList();
      return productsInselectedPriceRange;
    }
  }
}
