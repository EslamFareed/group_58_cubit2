import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_58_cubit2/cubits/categories/categories_cubit.dart';
import 'package:group_58_cubit2/cubits/products/products_cubit.dart';
import 'package:group_58_cubit2/views/map/map_screen.dart';
import 'package:group_58_cubit2/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit()),
        BlocProvider(create: (context) => CategoriesCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MapScreen(),
      ),
    );
  }
}
