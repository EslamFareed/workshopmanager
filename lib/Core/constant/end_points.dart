class EndPoints {
  // static String baseUrl = "https://shahmsa.com/api/v1/";
  static String baseUrl = "https://car-app.appifymisr.tech/api/v1/";
  static String login = "authentication/workshop/login";
  static String forgetPaswword = "authentication/verify-phone";
  static String otp = "authentication/validate-otp";
  static String resetPassword = "authentication/update-password";
  static String register = "authentication/workshop-manager/registeration";
  static String addWorkshop = "workshop-manager/workshops";
  static String service = "selectors/services";
  static String goves = "selectors/goves";
  static String brands = "selectors/car-brands-models";
  static String workshops = "workshop-manager/workshops";
  static String aboutWorkshop(String id) =>
      "workshop-manager/workshops/show/$id";
  static String orders(String id) => "workshop-manager/workshop/$id/orders";
  static String orderDetails(String id) => "workshop-manager/orders/$id";
  static String addWorkshopManager =
      "workshop-manager/employers-administration/employers";

  static String managers =
      "workshop-manager/employers-administration/employers";
  static String deleteWokshop(String id) =>
      "workshop-manager/workshops/delete/$id";
  static String deleteManager(String id) =>
      "workshop-manager/employers-administration/employers/$id";

  static String cancelOrder(int id) => "workshop-manager/orders/$id/cancel";
  static String services(String id) =>
      "/workshop-manager/workshop/services/$id";

  static String logout = "authentication/logout";

  static String updateManager(String id) =>
      "workshop-manager/employers-administration/employers/$id";
  static String showManager(String id) =>
      "workshop-manager/employers-administration/employers/$id";

  static String suggestedService(String id) =>
      "workshop-manager/order/$id/suggest-services";

  static String updateWorkshop(String id) =>
      "workshop-manager/workshops/update/$id";

  static String updateProfile = "workshop-manager/profile/update";

  static String addService(String id) =>
      "workshop-manager/workshop/$id/add/services";

  static String activeEmployer(String id) =>
      "workshop-manager/employers-administration/employers-activation/$id";
  static String cancelService(String orderId, String serviceId) =>
      "workshop-manager/orders/$orderId/cancel-service/$serviceId";

  static String activeWorkshops(String id) =>
      "workshop-manager/workshops/$id/activation";

  static String activeService(String id) =>
      "workshop-manager/workshops-service/$id/activation";

  static String notification = "client/notifications";
  static String changeNotificationState(String id) =>
      "client/notifications/$id";
  static String deleteNotification(String id) => "client/notifications/$id";

  static String changeOrderStatus(String id) =>
      "workshop-manager/orders/update-status/$id";

  static String deleteAccountEndPoint = "client/my-profile/delete";
}
