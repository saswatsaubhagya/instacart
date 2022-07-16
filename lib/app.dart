import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instacart/src/presentation/spalsh/view/splash.dart';

import 'src/repositories/auth/auth_repository.dart';
import 'src/repositories/local_db_repository.dart';
import 'src/repositories/preferences/preferences_repository.dart';

class InstaCartApp extends StatelessWidget {
  const InstaCartApp({
    Key? key,
    required this.prefsRepository,
    required this.localDbRepository,
    required this.authRepository,
  }) : super(key: key);

  final Preferences prefsRepository;
  final LocalDbRepository localDbRepository;
  final AuthenticationRepository authRepository;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: prefsRepository),
        RepositoryProvider.value(value: localDbRepository),
        RepositoryProvider.value(value: authRepository)
      ],
      child: Theme(
        data: ThemeData(
          colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.grey,
            primary: Colors.blue,
          ),
          useMaterial3: true,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          theme: ThemeData(
            colorScheme: theme.colorScheme.copyWith(
              secondary: Colors.grey,
              primary: Colors.blue,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
