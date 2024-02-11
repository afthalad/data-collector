class AppConfig {
  static const String apiUrl = "http://192.168.8.126:8101/api/";

  // Authenication
  static const String logout = "customer/logout";
  static const String profile = "customer/profile";
  static const String profileUpdate = "customer/profile/update";
  static const String profileDelete = "customer/profile/delete";
  static const String register = "customer/register";

  // Order
  static const String getOrdersByUser = "order/all";
  static const String createOrder = "order/create";

  // Address
  static const String getAddressByUser = "address";
  static const String createAddress = "address/create";
}
