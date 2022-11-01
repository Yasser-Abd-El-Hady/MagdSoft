import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/product_response.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  List<ProductModel> _allproducts = [];

  List<ProductModel> _filteredproducts = [];
  List<ProductModel> get filteredproducts => _filteredproducts;

  Future getProducts() async {
    try {
      var response =
          await DioHelper.getData(url: "$baseURL/getProducts", query: {});

      ProductResponseModel res = ProductResponseModel.fromJson(response.data);

      if (res.status != 200) {
        emit(ProductsError(res.message!));
      } else {
        _allproducts = _filteredproducts = res.products!;
        emit(ProductsFetched(res.message!));
      }
    } on DioError catch (e) {
      emit(ProductsError(e.response?.data['message']));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  void filterProducts({String? category}) {
    if (category != null) {
      _filteredproducts =
          _allproducts.where((element) => element.company == category).toList();
    } else {
      _filteredproducts = _allproducts;
    }
  }
}
