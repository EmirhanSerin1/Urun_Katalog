

import 'package:urun_katalog/models/products.dart';
import 'package:urun_katalog/services/services.dart';

class ListProductsViewModel{
  List<PicturesViewModel>? products;

  Future<void> fetchProducts() async{
    final api = await ProductService().fetchProductsApi();

    products = api.map((e) => PicturesViewModel(e)).toList();
  }

}


class PicturesViewModel {
  final Product? productModel;

  PicturesViewModel(this.productModel);
}