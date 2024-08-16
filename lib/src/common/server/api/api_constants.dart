final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  static const String baseUrl = "https://fakestoreapi.com";
  static const String baseUrlPost = "https://65c717aae7c384aada6e2dae.mockapi.io";

  static const String apiProduct = "/products";
  static const String apiCarts = "/carts";
  static const String apiBasket = "/backet";


}

final class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> cabinetSmsCheckParams({required String phone, required String code}) => <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};
}
