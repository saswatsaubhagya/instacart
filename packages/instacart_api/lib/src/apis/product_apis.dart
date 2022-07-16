import 'dart:convert';

import 'package:instacart_api/instacart_api.dart';

Future<List<Product>> getProductList({
  required InstaCartApiClient client,
  int? limit,
  int? skip,
}) async {
  try {
    final productResponse = await client.dio.get(apiProducts, queryParameters: {
      'limit': limit ?? 10,
      'skip': skip ?? 0,
    });
    if (productResponse.statusCode == 200) {
      Iterable it = productResponse.data['products'];
      return it.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get product list');
    }
  } catch (e) {
    throw e;
  }
}

Future<Product?> getProduct(InstaCartApiClient client, int id) async {
  try {
    final productResponse = await client.dio.get('apiProducts/$id');
    if (productResponse.statusCode == 200) {
      return Product.fromJson(productResponse.data);
    } else {
      throw Exception('Failed to get product');
    }
  } catch (e) {
    throw e;
  }
}

Future<List<Product>> getSearchProducts(
  InstaCartApiClient client,
  String query,
  int? limit,
  int? skip,
) async {
  try {
    final productResponse = await client.dio.get(
      apiProductSearch,
      queryParameters: {
        "q": query,
        'limit': limit ?? 10,
        'skip': skip ?? 0,
      },
    );
    if (productResponse.statusCode == 200) {
      Iterable it = json.decode(productResponse.data)['products'];
      return it.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get product list');
    }
  } catch (e) {
    throw e;
  }
}

Future<List<String>> getCategoryList(InstaCartApiClient client) async {
  try {
    final categoryResponse = await client.dio.get<List<dynamic>>(apiCategories);
    if (categoryResponse.data != null) {
      return categoryResponse.data!.map((e) => e.toString()).toList();
    }
    return [];
  } catch (e) {
    throw e;
  }
}

Future<List<Product>> getCategoryProductList({
  required InstaCartApiClient client,
  required String category,
  int? limit,
  int? skip,
}) async {
  try {
    final productResponse =
        await client.dio.get('$apiProductCategory/$category', queryParameters: {
      'limit': limit ?? 10,
      'skip': skip ?? 0,
    });
    if (productResponse.statusCode == 200) {
      Iterable it = productResponse.data['products'];
      return it.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get product list');
    }
  } catch (e) {
    throw e;
  }
}
