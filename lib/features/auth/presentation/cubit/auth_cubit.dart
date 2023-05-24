import 'package:amazon_clone/features/auth/domain/entities/enums/auth_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  void setAuthType(AuthType type) {
    emit(state.copyWith(authType: type));
  }
}
