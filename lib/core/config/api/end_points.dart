class EndPoints {
  static const String baseUrl = "https://exam.elevateegy.com/api/v1";
  // static const String baseImageUrl = "https://exam.elevateegy.com/images/";
  static const String refreshToken = "/auth/refresh-token";

  // Forget Password
  static const String forgetPassword = "/auth/forgotPassword";
  static const String verifyEmailCode = "/auth/verifyResetCode";
  static const String resetPassword = "/auth/resetPassword";
  static const String signupEndpoint = "/auth/signup";
  // added login endpoint
  static const String login = "/auth/signin";
}

class Apikeys {
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String userId = 'userId';
  static const String rememberMe = 'rememberMe';
}
