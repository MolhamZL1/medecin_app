import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/core/utils/go_route.dart';
import 'package:rosemary/feauters/splash/presentation/view_models/cubit/splash_cubit.dart';
import 'package:rosemary/feauters/splash/presentation/views/widgets/logo_image.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          GoRouter.of(context).pushReplacement(Routes.kHomeView);
        } else if (state is SplashFailure) {
          GoRouter.of(context).pushReplacement(Routes.kLoginView);
        }
      },
      child: Container(
        decoration: backgroundColor(),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoImage(),
          ],
        ),
      ),
    );
  }

  BoxDecoration backgroundColor() {
    return const BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color(0xFF0F919E),
        Color(0xFF3AAFB8),
        Color(0xFF63CAD1),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ));
  }
}
