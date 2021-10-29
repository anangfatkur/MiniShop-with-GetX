import 'package:get/state_manager.dart';
import 'package:mini_shop/controllers/products/products_repository.dart';

class ProductsController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();
  // RxBool loading = false.obs;
  List products = [].obs;
  var showGrid = false.obs;
  var loading = false.obs;

  // ProductsController() {
  //   loadProductsFromRepo();
  // }

  loadProductsFromRepo(String categoryName) async {
    loading(true);
    products = await productsRepository.loadProductsFromApi(categoryName);
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}
