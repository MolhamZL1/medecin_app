import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/core/utils/service_locator.dart';
import 'package:rosemary/feauters/auth/data/repos/login_repo/login_repo_imp.dart';
import 'package:rosemary/feauters/auth/data/repos/register_repo/register_repo_imp.dart';
import 'package:rosemary/feauters/auth/presentation/view_models/loginCubit/login_cubit.dart';
import 'package:rosemary/feauters/auth/presentation/view_models/registerCubit/register_cubit.dart';
import 'package:rosemary/feauters/auth/presentation/views/login_view.dart';
import 'package:rosemary/feauters/auth/presentation/views/register_view.dart';
import 'package:rosemary/feauters/home/presentation/views/home_view.dart';
import 'package:rosemary/feauters/splash/presentation/view_models/cubit/splash_cubit.dart';
import 'package:rosemary/feauters/splash/presentation/views/splash_view.dart';

abstract class Routes {
  static const kLoginView = '/kLoginView';
  static const kHomeView = '/homeView';
  static const kRegisterView = '/registerView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit()..fetchSplash(),
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginRepoImp>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getIt.get<RegisterRepoImp>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}