class AppLink {
  static const String server = "";
  static const String test = "";

//========================= Auth ==================================//
  static const String signupApi = "http://10.0.2.2:8000/api/register";
  // static const String loginApi = "http://10.0.2.2:8000/api/login";
    static const String loginApi = "http://10.0.2.2:8000/api/login";
  static const String verifycodeSignupApi = "";

//========================= forget password ==================================//
  static const String checkEmailApi = "http://10.0.2.2:8000/api/verify/send-code";
  static const String resetpasswordApi = "";
  static const String verifycodeForgetpasswordApi = "http://10.0.2.2:8000/api/verify/reset?code=630725&password=123456";

  //==========================home===============================//
  static const String HomePage ="http://10.0.2.2:8000/api/bas-catigories";
  static const String Items ="http://10.0.2.2:8000/api/bas-catigories";
}
