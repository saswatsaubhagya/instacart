import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var category = categories[index];
          return InputChip(
            onPressed: () {
              context.read<HomeCubit>().getCategoryProducts(category);
            },
            onDeleted: category == context.read<HomeCubit>().selectedCategory
                ? () {
                    context.read<HomeCubit>().clearSelectedCategory();
                  }
                : null,
            deleteIconColor: Colors.black54,
            label: Text(category),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
