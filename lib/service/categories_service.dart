import 'package:dio/dio.dart';
import 'package:test_second/model/base/Products_model.dart';
import 'package:test_second/service/base_service.dart';

abstract class CategoriesService extends BaseService {
  Future<List<ProductsModel>> getAllProduct();
}

class CategoriesServiceImp extends CategoriesService {
  @override
  Future<List<ProductsModel>> getAllProduct() async {
    Response response = await dio.get(baseUrl);
    print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data['products'];
      return temp;
    } else {
      return [];
    }
  }
}
