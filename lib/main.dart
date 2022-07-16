import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instacart_api/instacart_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'src/repositories/auth/auth_repository.dart';
import 'src/repositories/local_db_repository.dart';
import 'src/repositories/preferences/preferences_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsRepository =
      Preferences(sharedPref: await SharedPreferences.getInstance());
  final localDbRepository = LocalDbRepository();
  final _dio = Dio();
  final apiClient = InstaCartApiClient(_dio);
  final authRepository = AuthenticationRepository(apiClient);

  await runZonedGuarded(() async {
    runApp(
      InstaCartApp(
        prefsRepository: prefsRepository,
        localDbRepository: localDbRepository,
        authRepository: authRepository,
      ),
    );
  }, (error, stackTrace) {
    print(error);
  });
}
