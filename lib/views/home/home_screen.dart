import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_58_cubit2/cubits/categories/categories_cubit.dart';
import 'package:group_58_cubit2/cubits/products/products_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesCubit.get(context).getCategories();
    ProductsCubit.get(context).getProducts();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is LoadingCategoriesState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ErrorCategoriesState) {
                      return const Center(
                          child: Text("please try again later..."));
                    }
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final item =
                            CategoriesCubit.get(context).categories[index];
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(item.image ?? ""),
                            ),
                            Text(item.name ?? ""),
                          ],
                        );
                      },
                      itemCount: CategoriesCubit.get(context).categories.length,
                    );
                  },
                ),
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is LoadingProductsState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ErrorProductsState) {
                    return const Center(
                        child: Text("please try again later..."));
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final item = ProductsCubit.get(context).products[index];
                      return Column(
                        children: [
                          Image.network(item.images![0]),
                          Text(item.title ?? ""),
                          Text(item.description ?? ""),
                        ],
                      );
                    },
                    itemCount: ProductsCubit.get(context).products.length,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
