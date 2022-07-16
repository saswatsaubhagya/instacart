import 'package:dio/dio.dart';

class HttpException implements Exception {}

class InstaCartApiClient {
  InstaCartApiClient(Dio dio, {String? baseUrl})
      : _dio = dio
          // ..interceptors.add(
          //   PrettyDioLogger(
          //     requestHeader: true,
          //     requestBody: true,
          //     responseBody: true,
          //     responseHeader: false,
          //     error: true,
          //     compact: true,
          //     maxWidth: 90,
          //   ),
          // )
          ..options.baseUrl = baseUrl ?? 'https://dummyjson.com/';

  final Dio _dio;
  Dio get dio => _dio;

  // Future<User?> authenticate({
  //   required String phone,
  //   required Json deviceDetails,
  //   required String fcmToken,
  // }) async {
  //   try {
  //     final response = await _dio.post<String>(
  //       apiLogin,
  //       data: {
  //         'phone_number': phone,
  //         'device_info': deviceDetails,
  //         'fcm_token': fcmToken,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return User.fromJson(json.decode(response.data ?? ''));
  //     } else if (response.statusCode == 404) {
  //       return null;
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       if (e.response!.statusCode == 404) {
  //         final authResponse =
  //             AuthResponse.fromJson(json.decode(e.response!.data));
  //         setAccessToken(authResponse.accessToken);
  //       }
  //     }
  //   }
  // }

  // Future<void> requestOtp({
  //   required String phone,
  //   required String countryCode,
  //   required String signature,
  //   required int attempt,
  // }) async {
  //   final response = await _dio.get<Json>(
  //     apiAuthOtp,
  //     queryParameters: <String, String>{
  //       'phone_number': phone,
  //       'action': 'send',
  //       'country_code': countryCode,
  //       'signature': signature,
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     return;
  //   } else {
  //     throw ApiError(response: response);
  //   }
  // }

  // Future<User?> verifyOtp({
  //   required String phone,
  //   required String otpCode,
  //   required String version,
  // }) async {
  //   try {
  //     final response = await _dio.get<Json>(
  //       apiAuthOtp,
  //       queryParameters: <String, dynamic>{
  //         'phone_number': phone,
  //         'otp': otpCode,
  //         'action': 'verify',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return User.fromJson(response.data!);
  //     } else if (response.statusCode == 404) {
  //       return null;
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       if (e.response!.statusCode == 404) {
  //         return null;
  //       }
  //     }
  //   }
  // }

  // Future<bool> register({
  //   required String name,
  //   required String email,
  //   required String dob,
  //   required String referral,
  //   required String appVersion,
  //   required String os,
  // }) async {
  //   await _dio.post<String>(
  //     apiAuthRegister,
  //     data: <String, dynamic>{
  //       'name': name,
  //       'email': email,
  //       'dob': dob,
  //       'app_version': appVersion,
  //       'device_platform': os,
  //       'refby_refcode': referral,
  //     },
  //   );
  //   return true;
  // }

  // Future<List<Region>> getRegions() async {
  //   final response = await _dio.get<List<dynamic>>(
  //     apiRegions,
  //   );
  //   return response.data!
  //       .map((region) => Region.fromJson(region as Map<String, dynamic>))
  //       .toList();
  // }

  // Future<Notifications> getNotifications() async {
  //   final notificationsResponseJson =
  //       await _dio.get<String>(apiGetNotificationList);
  //   Iterable it = json.decode(notificationsResponseJson.data ?? '');
  //   List<AppNotification> _notifications = [];
  //   _notifications = it.map((e) => AppNotification.fromJson(e)).toList();
  //   return Notifications(notifications: _notifications);
  // }

  // Future<List<Transaction>> getTransactions(int page) async {
  //   final transactionsResponseJson = await _dio.get<String>(
  //       apiGetTransactionList,
  //       queryParameters: {'page_number': page});
  //   late final List<Transaction> transactionList;
  //   transactionList = (json.decode(transactionsResponseJson.data!) as List)
  //       .map((transactionJson) => Transaction.fromJson(transactionJson))
  //       .toList();
  //   return transactionList;
  // }

  // Future<List<Offer>> getBanners(int? regionId) async {
  //   final offersResponseJson =
  //       await _dio.get<List<dynamic>>(apiGetBanners, queryParameters: {
  //     'region_id': regionId,
  //   });
  //   late final List<Offer> offers;
  //   offers = (offersResponseJson.data!)
  //       .map((offer) => Offer.fromJson(offer))
  //       .toList();
  //   return offers;
  // }

  // Future<String> getAllProducts({int? regionId}) async {
  //   final allProductsJson = await _dio
  //       .get<List<dynamic>>(apiAllProducts, queryParameters: <String, dynamic>{
  //     'region_id': regionId,
  //   });
  //   return json.encode(allProductsJson.data!);
  // }

  // Future<List<ProductCategory>> getProductCategories(
  //     Map<String, dynamic> allProductsJson) async {
  //   final productCategories = (allProductsJson as List<dynamic>)
  //       .map((category) => ProductCategory.fromJson(category))
  //       .toList();
  //   return productCategories;
  // }

  // Future<List<Address>> getAddressList() async {
  //   final addressesResponse =
  //       await _dio.get<List<Map<String, dynamic>>>(apiAddress);
  //   if (addressesResponse.data != null) {
  //     return addressesResponse.data!
  //         .map((address) => Address.fromJson(address))
  //         .toList();
  //   }
  //   return [];
  // }

  // Future<List<Faq>> getFaq() async {
  //   final faqResponse = await _dio.get(apiFaq);
  //   if (faqResponse.data != null) {
  //     Iterable it = faqResponse.data;
  //     return it.map((e) => Faq.fromJson(e)).toList();
  //   }
  //   return [];
  // }

  // Future<List<Product>> getRecommendationProduct() async {
  //   final response = await _dio.get(apiProductRecommendation);
  //   if (response.data != null) {
  //     Iterable it = response.data;
  //     return it.map((e) => Product.fromJson(e)).toList();
  //   }
  //   return [];
  // }
}
