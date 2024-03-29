import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rosemary/core/shared/shared.dart';
import 'package:rosemary/feauters/auth/data/repos/login_repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> fetchLogin({
    required String phoneNumber,
    required String password,
  }) async {
    // Map<String, dynamic>? data;
    emit(LoginLoading());
    var result = await loginRepo.fetchLogin(
        phoneNumber: phoneNumber, password: password);
    result.fold((failure) => emit(LoginFailure(errMessage: failure.errMessage)),
        (value) async {
      emit(LoginSuccess());
      await CacheNetwork.insertToCache(key: 'token', value: value);
    });

    //await CacheNetwork.insertToCache(key: 'username', value: data!['username']);
  }
}
