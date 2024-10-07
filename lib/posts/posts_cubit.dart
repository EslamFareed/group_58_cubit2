import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  static PostsCubit get(context) => BlocProvider.of(context);

  List<Map> posts = [];

  void getData() async {
    emit(LoadingPostsState());
    posts = [];
    try {
      var res = await Dio().get("https://jsonplaceholder.typicode.com/posts");

      if (res.statusCode == 200) {
        var data = res.data as List;

        for (var element in data) {
          posts.add(element);
        }
        emit(SuccessPostsState());
        // setState(() {});
      } else {
        print("Error ${res.statusCode}");
        emit(ErrorPostsState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorPostsState());
    }
  }
}
