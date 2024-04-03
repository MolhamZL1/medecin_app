import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/utils/go_route.dart';
import 'package:rosemary/feauters/auth/presentation/view_models/loginCubit/login_cubit.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/customButton.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/customNumricTextField.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/question_login_section.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/up_login_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccess) {
        GoRouter.of(context).pushReplacement(Routes.kHomeView);
      } else if (state is LoginFailure) {
        isLoading = false;
        customshowSnackBar(
          context,
          massege: state.errMessage,
          color: Colors.redAccent,
        );
      }
    }, builder: (context, state) {
      if (state is LoginLoading) {
        isLoading = true;
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const UpSection(),
              CustomNumericTextField(controller: textController),
              const SizedBox(height: 12),
              CustomPasswordTextField(controller: passwordController),
              const SizedBox(height: 20),
              CustomButton(
                isLoading: isLoading,
                text: "Login",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<LoginCubit>(context).fetchLogin(
                        phoneNumber: textController.text,
                        password: passwordController.text);
                  }
                },
              ),
              const SizedBox(height: 12),
              const QuestionSection(),
            ],
          ),
        ),
      );
    });
  }
}
