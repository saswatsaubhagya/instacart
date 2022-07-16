import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instacart/src/presentation/home/home.dart';

import '../../../extensions/context_x.dart';
import '../widgets/categorylist.dart';
import '../widgets/productlist.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.apiClient),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => state.when(
            initial: () => const Center(child: SizedBox()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (products, categories) => Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Instacart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: CategoryList(categories: categories),
                ),
                const Divider(
                  height: 8,
                  color: Colors.grey,
                ),
                ProductList(products: products)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
