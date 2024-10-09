import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_58_cubit2/models/category_model.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);

  // List<Map> categories = [];

  List<CategoryModel> categories = [];

  void getCategories() async {
    emit(LoadingCategoriesState());
    try {
      var response =
          await Dio().get("https://api.escuelajs.co/api/v1/categories");
      if (response.statusCode == 200) {
        var data = response.data as List;

        for (var element in data) {
          categories.add(CategoryModel.fromJson(element));
        }

        emit(SuccessCategoriesState());
      } else {
        emit(ErrorCategoriesState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorCategoriesState());
    }
  }
}
