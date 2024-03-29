import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/core/shared/shared.dart';
import 'package:rosemary/feauters/auth/data/repos/register_repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  Future<void> fetchRegister({
    required String userName,
    required String phoneNumber,
    required String password,
  }) async {
    // Map<String, dynamic>? data;
    emit(RegisterLoading());
    var result = await registerRepo.fetchRegister(
        userName: userName, phoneNumber: phoneNumber, password: password);
    result.fold(
        (failure) => emit(RegisterFailure(errMessage: failure.errMessage)),
        (value) async {
      emit(RegisterSuccess());
      await CacheNetwork.insertToCache(key: 'token', value: value);
    });

    //await CacheNetwork.insertToCache(key: 'username', value: data!['username']);
  }
}
