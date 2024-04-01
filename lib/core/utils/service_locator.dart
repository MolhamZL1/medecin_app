import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/feauters/auth/data/repos/login_repo/login_repo_imp.dart';
import 'package:rosemary/feauters/auth/data/repos/register_repo/register_repo_imp.dart';
import 'package:rosemary/feauters/home/data/repos/home_repo_imp.dart';
import 'package:rosemary/feauters/medicine_details/data/repos/medecine_details_repo_imp.dart';
import 'package:rosemary/feauters/medicines/data/repos/medecines_repo_imp.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
  ));
  getIt.registerSingleton<LoginRepoImp>(LoginRepoImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<RegisterRepoImp>(RegisterRepoImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<MedecinesRepoImp>(MedecinesRepoImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<MedicineDetailsRepoImp>(MedicineDetailsRepoImp(
    getIt.get<ApiService>(),
  ));
}
