enum ResetPasswordResponse{
ok,
networkRequestFailed,
userDisabled,
userNotFound,
tooManyRequests,
unknow,
}

ResetPasswordResponse stringToResetPasswordRespone(String code) {
  switch(code){
   case "internal-error":
    return ResetPasswordResponse.tooManyRequests;
   case "user-not-found":
    return ResetPasswordResponse.userNotFound;
   case "user-disabled":
    return ResetPasswordResponse.userDisabled;
   case "network-request-failed":
    return ResetPasswordResponse.networkRequestFailed;

    default:
     return ResetPasswordResponse.unknow;
  }
}