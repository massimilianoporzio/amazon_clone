import 'package:amazon_clone/core/services/api/dio/dio_client.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*BLOCS / CUBITS

  //Auth cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit());

  //*third party
  //dio client
  sl.registerSingleton<Dio>(await DioClient.createDio());
}
