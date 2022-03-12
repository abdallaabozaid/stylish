import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stylish/config/enums.dart';
import 'package:stylish/src/data/model/search_filters_model.dart';

part 'search_filters_state.dart';

class SearchFiltersCubit extends Cubit<SearchFiltersState> {
  SearchFiltersCubit({required this.searchFiltersModel})
      : super(SearchFiltersState(searchFiltersModel));

  SearchFiltersModel searchFiltersModel;
  void changeSearchFilters({
    SectionName? sectionName,
    RangeValues? priceRangeValues,
    RangeValues? distanceRangeValues,
  }) {
    searchFiltersModel = SearchFiltersModel(
      sectionName: sectionName ?? searchFiltersModel.sectionName,
      priceRanegValue: priceRangeValues ?? searchFiltersModel.priceRanegValue,
      distanceRanegValue:
          distanceRangeValues ?? searchFiltersModel.distanceRanegValue,
    );

    emit(SearchFiltersState(searchFiltersModel));
  }

  void resetFilters() {
    searchFiltersModel = SearchFiltersModel();
    emit(SearchFiltersState(searchFiltersModel));
  }
}
