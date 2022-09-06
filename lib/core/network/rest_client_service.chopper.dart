// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RestClientService extends RestClientService {
  _$RestClientService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestClientService;

  @override
  Future<Response<dynamic>> getAdvertisements() {
    final $url = 'https://www.safihealth.org/api/advs';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllSliders() {
    final $url = 'https://www.safihealth.org/api/sliders';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllBanners() {
    final $url = 'https://www.safihealth.org/api/baners';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPackages() {
    final $url = 'https://www.safihealth.org/api/package-list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getDoctorCategories() {
    final $url = 'https://www.safihealth.org/api/doctor-speciality';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getDoctorsByCategories(String id) {
    final $url = 'https://www.safihealth.org/api/speciality-wise-doctor/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllNurses() {
    final $url = 'https://www.safihealth.org/api/nurse-list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllHospitals() {
    final $url = 'https://www.safihealth.org/api/hospitals';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllAmbulances() {
    final $url = 'https://www.safihealth.org/api/ambulance';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllDiagnosticCenters() {
    final $url = 'https://www.safihealth.org/api/diagnostic-list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBloodDonerList() {
    final $url = 'https://www.safihealth.org/api/blood-doner-list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBloodNeededList() {
    final $url = 'https://www.safihealth.org/api/blood/needed-list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUser(String token) {
    final $url = 'https://www.safihealth.org/api/auth/user';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getShopProducts() {
    final $url = 'https://www.safihealth.org/api/products';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getShopCategories() {
    final $url = 'https://www.safihealth.org/api/product/category';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getEmergencyDoctor() {
    final $url = 'https://www.safihealth.org/api/emergency/doctor';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllServices() {
    final $url = 'https://www.safihealth.org/api/services';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getServices(String id) {
    final $url = 'https://www.safihealth.org/api/service/details/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getMyAppointments(String id) {
    final $url = 'https://www.safihealth.org/api/my/appointment/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCartItems(String id) {
    final $url = 'https://www.safihealth.org/api/cart-item/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> checkOut(String id) {
    final $url = 'https://www.safihealth.org/api/checkout/order/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNurseAppointments(String id) {
    final $url =
        'https://www.safihealth.org/api/my/appointment-list/nurse/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBlogs() {
    final $url = 'https://www.safihealth.org/api/blog-post';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> login(String body) {
    final $url = 'https://www.safihealth.org/api/auth/login';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> register(String body) {
    final $url = 'https://www.safihealth.org/api/auth/register';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logOutUser(String token) {
    final $url = 'https://www.safihealth.org/api/auth/logout';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> bookAppointment(
      String customerId,
      String doctorId,
      String hospitalId,
      String customerType,
      String appointmentDate,
      String appointmentTime,
      String customerInfo) {
    final $url = 'https://www.safihealth.org/api/appointment';
    final $params = <String, dynamic>{
      'customerId': customerId,
      'doctorId': doctorId,
      'hospitalId': hospitalId,
      'customerType': customerType,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'customerInfo': customerInfo
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> bookNurseAppointment(
      String customerId,
      String nurseId,
      String hospitalId,
      String customerType,
      String appointmentDate,
      String appointmentTime,
      String customerInfo) {
    final $url = 'https://www.safihealth.org/api/appointment/nurse';
    final $params = <String, dynamic>{
      'customerId': customerId,
      'nurseId': nurseId,
      'hospitalId': hospitalId,
      'customerType': customerType,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'customerInfo': customerInfo
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addBloodRequest(String body) {
    final $url = 'https://www.safihealth.org/api/add/blood/request';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUser(String id, String body, String token) {
    final $url = 'https://www.safihealth.org/api/auth/profile/update/${id}';
    final $headers = {
      'Authorization': token,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addToCart(String body) {
    final $url = 'https://www.safihealth.org/api/add-to-cart';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteItemFromCart(String body) {
    final $url = 'https://www.safihealth.org/api/cart-item/delete';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addCredit(String body) {
    final $url = 'https://www.safihealth.org/api/add/credit';
    final $headers = {
      'Content-Type': 'application/json',
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
