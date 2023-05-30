abstract interface class AuthService {
  void signupUser(
      {required String email, required String password, required String name});
}
