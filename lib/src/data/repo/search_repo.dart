import 'package:stylish/src/data/model/product_model.dart';

class SearchRepo {
  List<ProductModel> products;
  SearchRepo({
    required this.products,
  });

  List<ProductModel> searchProducts(String searchWord) {
    final searchResults = products
        .where((element) => element.productName.contains(searchWord))
        .toList();
    return searchResults;
  }
}
