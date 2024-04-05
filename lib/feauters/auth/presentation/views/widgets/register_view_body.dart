import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/utils/go_route.dart';
import 'package:rosemary/feauters/auth/presentation/view_models/registerCubit/register_cubit.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/customButton.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/customNumricTextField.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/customTextField.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/question_register_section.dart';
import 'package:rosemary/feauters/auth/presentation/views/widgets/up_register_section.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSuccess) {
        GoRouter.of(context).pushReplacement(Routes.kHomeView);
      } else if (state is RegisterFailure) {
        isLoading = false;
        customshowSnackBar(
          context,
          massege: state.errMessage,
          color: Colors.redAccent,
        );
      }
    }, builder: (context, state) {
      if (state is RegisterLoading) {
        isLoading = true;
      }
      return AbsorbPointer(
        absorbing: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const UpRegisterSection(),
                CustomTextField(controller: userNameController),
                const SizedBox(height: 12),
                CustomNumericTextField(controller: phoneNumberController),
                const SizedBox(height: 12),
                CustomPasswordTextField(controller: passwordController),
                const SizedBox(height: 20),
                CustomButton(
                    isLoading: isLoading,
                    text: "Register",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context).fetchRegister(
                            userName: userNameController.text,
                            phoneNumber: phoneNumberController.text,
                            password: passwordController.text);
                      }
                    }),
                const SizedBox(height: 12),
                const QuistionLoginSection(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
