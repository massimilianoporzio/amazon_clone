import 'package:dartz/dartz.dart';

import '../errors/fialures.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
