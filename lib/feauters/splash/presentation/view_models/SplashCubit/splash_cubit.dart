import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rosemary/core/shared/shared.dart';
import 'package:rosemary/core/utils/user_info.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  Future<void> fetchSplash() async {
    emit(SplashLoading());
    await CacheNetwork.cacheInitialization();
    UserInfo.token = await CacheNetwork.getCacheData(key: 'token');
    UserInfo.username = await CacheNetwork.getCacheData(key: 'username');
    await Future.delayed(const Duration(seconds: 2));
    if (UserInfo.token != null) {
      emit(SplashSuccess());
    } else {
      emit(SplashFailure());
    }
  }
}
