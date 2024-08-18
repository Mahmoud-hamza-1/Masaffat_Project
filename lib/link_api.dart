const String _baseUrl = "http://192.168.1.103:8000/api";
const String baseUrl1 = "http://192.168.1.103:8000";

class AppLink {
  AppLink._();
  static const String server = "";
  static const String test = "";

//========================= Auth ==================================//
  static const String signupApi = "$_baseUrl/register";
  static const String loginApi = "$_baseUrl/login";
  static const String verifycodeSignupApi = "";

//========================= forget password ==================================//
  static const String checkEmailApi = "$_baseUrl/verify/send-code";
  static const String resetpasswordApi = "";
  static const String verifycodeForgetpasswordApi =
      "$_baseUrl/verify/reset?code=630725&password=123456";

  //==========================home===============================//
  static const String HomePage = "$_baseUrl/bas-catigories";
  static const String Items = "$_baseUrl/bas-catigories";

  static const String searchParkingRadius =
      "$_baseUrl/searchParkingsWithinRadius";

  static const String advert = "$_baseUrl/indexAdverts";
  static const addBooking = "$_baseUrl/addBooking";
}
