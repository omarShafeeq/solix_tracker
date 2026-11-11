import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  static const String username = '123';
  static const String password = 'solix321';

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (isClosed) {
      return;
    }
    if (username.trim() == AuthCubit.username && password == AuthCubit.password) {
      emit(state.copyWith(status: AuthStatus.authenticated, clearError: true));
      return;
    }
    emit(
      state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'اسم المستخدم أو كلمة المرور غير صحيحة.',
      ),
    );
  }
}
