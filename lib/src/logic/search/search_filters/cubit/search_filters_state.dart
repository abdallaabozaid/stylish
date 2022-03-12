part of 'search_filters_cubit.dart';

// abstract
class SearchFiltersState extends Equatable {
  const SearchFiltersState(
    this.searchFiltersModel,
  );

  final SearchFiltersModel searchFiltersModel;
  @override
  List<Object> get props => [
        searchFiltersModel,
        searchFiltersModel.sectionName,
        searchFiltersModel.priceRanegValue,
        searchFiltersModel.distanceRanegValue
      ];
}

// class SearchFiltersInitial extends SearchFiltersState {
//   const SearchFiltersInitial(this.searchFiltersModell)
//       : super(searchFiltersModell);

//   final SearchFiltersModel searchFiltersModell;
// }

// class ChangeSearchFilters extends SearchFiltersState {
//   const ChangeSearchFilters(this.searchFiltersModell)
//       : super(searchFiltersModell);

//   final SearchFiltersModel searchFiltersModell;
// }
