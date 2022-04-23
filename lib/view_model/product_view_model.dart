import 'package:urun_katalog/models/products.dart';
import 'package:urun_katalog/services/services.dart';

class ListProductsViewModel{
  List<ProductsViewModel>? products;

  Future<void> fetchProducts() async{
    final api = await ProductService().fetchProductsApi();

    products = api.map((e) => ProductsViewModel(e)).toList();
  }

}


class ProductsViewModel {
  final Product? productModel;

  ProductsViewModel(this.productModel);
}