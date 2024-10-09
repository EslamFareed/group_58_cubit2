import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_58_cubit2/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void getProducts() async {
    emit(LoadingProductsState());
    try {
      var response =
          await Dio().get("https://api.escuelajs.co/api/v1/products");
      if (response.statusCode == 200) {
        var data = response.data as List;

        for (var element in data) {
          products.add(ProductModel.fromJson(element));
        }

        emit(SuccessProductsState());
      } else {
        emit(ErrorProductsState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorProductsState());
    }
  }
}
