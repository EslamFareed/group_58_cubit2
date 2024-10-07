import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_58_cubit2/posts/posts_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostsCubit.get(context).getData();

    final cubit = PostsCubit.get(context);

    return Scaffold(
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorPostsState) {
            return const Center(child: Text("Please try again, later"));
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(cubit.posts[index]["title"]),
                  subtitle: Text(cubit.posts[index]["body"]),
                ),
              );
            },
            itemCount: cubit.posts.length,
          );
        },
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:group_58_cubit2/cubit/home_cubit.dart';
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: BlocBuilder<HomeCubit, HomeState>(
//           builder: (context, state) {
//             return Row(
//               children: [
//                 Expanded(
//                   child: RadioListTile(
//                     value: "male",
//                     groupValue: HomeCubit.get(context).gender,
//                     title: const Text("Male"),
//                     onChanged: (value) {
//                       HomeCubit.get(context).changeGender(value);
//                       // setState(() {
//                       //   gender = value!;
//                       // });
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: RadioListTile(
//                     value: "female",
//                     groupValue: HomeCubit.get(context).gender,
//                     title: const Text("Female"),
//                     onChanged: (value) {
//                       HomeCubit.get(context).changeGender(value);
//                       // setState(() {
//                       //   gender = value!;
//                       // });
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }