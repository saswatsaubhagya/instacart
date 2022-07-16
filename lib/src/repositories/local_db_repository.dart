import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _tableName = 'tbl_products';
const _dbName = 'instacart.db';

const createTableQuery = '''
CREATE TABLE $_tableName(
  id INTEGER PRIMARY KEY,
  title TEXT,
  description TEXT,
  price INTEGER,
  discount REAL,
  rating REAL,
  stock INTEGER,
  brand TEXT,
  category TEXT,
  thumbnail TEXT,
  images TEXT,
)
''';

class ProductNotFoundError implements Exception {}

class LocalDbRepository {
  LocalDbRepository();
  late Database _db;
  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _dbName);
    _db = await openDatabase(
      path,
      version: 2,
      onCreate: (database, version) async {
        await database.execute(createTableQuery);
      },
    );
  }

  Future<int> insertJson({required String data}) async {
    await _db.delete(_tableName);
    return _db.insert(_tableName, {'json': data});
  }

  // Future<List<Product>?> getAllProducts() async {
  //   final map = await _db.query(_tableName);
  //   final allProductsJson =
  //       json.decode(map.first['json'].toString()) as List<dynamic>;
  //   return map.isEmpty
  //       ? null
  //       : allProductsJson
  //           .map(
  //             (dynamic category) =>
  //                 ProductCategory.fromJson(category as Map<String, dynamic>),
  //           )
  //           .toList();
  // }

  // Future<Product> getProductFromPid(int pid) async {
  //   final productCategories = await getAllProducts();
  //   late final Product foundProduct;
  //   if (productCategories != null) {
  //     for (var category in productCategories) {
  //       category.products.forEach((product) {
  //         if (product.productId == pid) {
  //           foundProduct = product;
  //         }
  //       });
  //     }
  //     return foundProduct;
  //   } else {
  //     throw ProductNotFoundError();
  //   }
  // }

  // Future<List<Product>> getProductsByCategory(int categoryId) async {
  //   final allProducts = await getAllProducts();
  //   if (allProducts != null) {
  //     return allProducts
  //         .firstWhere((category) => category.id == categoryId)
  //         .products;
  //   }
  //   return [];
  // }
}
