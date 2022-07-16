import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instacart_api/instacart_api.dart';

import '../repositories/auth/auth_repository.dart';
import '../repositories/preferences/preferences_repository.dart';

extension ContextX on BuildContext {
  Preferences get preferences => read<Preferences>();
  InstaCartApiClient get apiClient =>
      read<AuthenticationRepository>().apiClient;
}
