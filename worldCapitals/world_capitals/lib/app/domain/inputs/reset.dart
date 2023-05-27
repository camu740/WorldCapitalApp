enum ResetPasswordResponse {
  networkRequestFailed,
  invalidEmail,
  userDisabled,
  userNotFound,
  tooManyRequest,
  unknown,
  ok,
}


ResetPasswordResponse stringToResetPasswordResponse(String code) {
  switch (code) {
    case "invalid-email":
      return ResetPasswordResponse.invalidEmail;
    case "user-disabled":
      return ResetPasswordResponse.userDisabled;
    case "user-not-found":
      return ResetPasswordResponse.userNotFound;
    case "internal-error":
      return ResetPasswordResponse.tooManyRequest;
    case "network-request-failed":
      return ResetPasswordResponse.networkRequestFailed;
    default:
      return ResetPasswordResponse.unknown;
  }
}
