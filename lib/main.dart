import 'dart:io';

import 'package:bloc_1/core/base/bloc/auth/auth_bloc.dart';
import 'package:bloc_1/core/base/bloc/counter/counter_bloc.dart';
import 'package:bloc_1/core/base/bloc/grocery/home/home_bloc.dart';
import 'package:bloc_1/core/base/bloc/ui/ui_bloc.dart';
import 'package:bloc_1/core/base/bloc/users/users_bloc.dart';
import 'package:bloc_1/core/base/service/auth_service.dart';
import 'package:bloc_1/core/base/service/users_service.dart';
import 'package:bloc_1/core/constants/app/string_constants.dart';
import 'package:bloc_1/core/init/cache/auth_cache_manager.dart';
import 'package:bloc_1/core/init/network/dio_manager.dart';
import 'package:bloc_1/core/view/auth/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(
              AuthService(DioManager.instance),
              AuthCacheManager(),
            )),
    BlocProvider<CounterBloc>(create: (_) => CounterBloc()),
    BlocProvider<UiBloc>(create: (_) => UiBloc()),
    BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
    BlocProvider<UsersBloc>(
        create: (_) => UsersBloc(
              UsersService(DioManager.instance),
            )),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstants.appName,
        home: SplashView(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
