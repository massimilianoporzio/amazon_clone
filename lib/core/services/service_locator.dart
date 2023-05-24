import 'package:amazon_clone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*BLOCS / CUBITS

  //Auth cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit());
}
