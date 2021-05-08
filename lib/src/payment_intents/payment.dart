import '../src.dart';

extension PayMongoPaymentIntent on PayMongoSDK {
  Future<String?> createPaymentIntent(PaymentIntentAttributes data) async {
    final options = PayMongoOptions(
      data: {'attributes': data.toMap()},
      path: '/payment_intents',
    );
    final response = await post(options);

    return response;
  }

  Future<String?> retreivePaymentIntent(int id) async {
    if (id <= 0) {
      throw ArgumentError("ID must be greater than 0");
    }

    final options = PayMongoOptions(
      path: '/payment_intents/$id',
    );

    final response = await get(options);

    return response;
  }

  Future<Map<String, dynamic>> attachToPaymentIntent(
    int id,
    PaymentIntentAttach data,
  ) async {
    if (id <= 0) {
      throw ArgumentError("id must be real integer");
    }
    final options = PayMongoOptions(
      path: '/payment_intents/$id/attach',
      data: {
        'attributes': data.toMap(),
      },
    );
    final response = await post<Map<String, dynamic>>(options) ?? {};
    return response;
  }
}
