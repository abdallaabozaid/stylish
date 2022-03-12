import 'package:flutter/material.dart';
import 'package:stylish/config/enums.dart';

class SearchFiltersModel {
  SectionName sectionName;
  RangeValues priceRanegValue;
  RangeValues distanceRanegValue;
  SearchFiltersModel({
    this.sectionName = SectionName.newArrivals,
    this.priceRanegValue = const RangeValues(100, 300),
    this.distanceRanegValue = const RangeValues(10, 25),
  });
}
