import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/blocObserve/blocobserve.dart';
import 'package:rosemary/core/shared/shared.dart';
import 'package:rosemary/core/utils/go_route.dart';
import 'package:rosemary/core/utils/service_locator.dart';

void main() async {
  await CacheNetwork.cacheInitialization();
  setupServiceLocator();
  BlocOverrides.runZoned(() => runApp(const Rosemary()),
      blocObserver: MyBlocObserver());
}

class Rosemary extends StatelessWidget {
  const Rosemary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
    );
  }
}
