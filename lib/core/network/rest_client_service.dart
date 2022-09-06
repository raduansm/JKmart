import 'package:chopper/chopper.dart';
import 'package:jkmart/core/utils/constants.dart';

part "rest_client_service.chopper.dart";

@ChopperApi(baseUrl: API_BASE_URL)
abstract class RestClientService extends ChopperService {
  static RestClientService create([ChopperClient? client]) => _$RestClientService(client);

  //Get requests
  // @Get(path: '/experiencesListVendor')
  // Future<Response> getServiceList();

  @Get(path: '/advs')
  Future<Response> getAdvertisements();

  @Get(path: '/sliders')
  Future<Response> getAllSliders();

  @Get(path: '/baners')
  Future<Response> getAllBanners();

  @Get(path: '/package-list')
  Future<Response> getAllPackages();

  @Get(path: '/doctor-speciality')
  Future<Response> getDoctorCategories();

  @Get(path: '/speciality-wise-doctor/{id}')
  Future<Response> getDoctorsByCategories(@Path() String id);

  @Get(path: '/nurse-list')
  Future<Response> getAllNurses();

  @Get(path: '/hospitals')
  Future<Response> getAllHospitals();

  @Get(path: '/ambulance')
  Future<Response> getAllAmbulances();

  @Get(path: '/diagnostic-list')
  Future<Response> getAllDiagnosticCenters();

  @Get(path: '/blood-doner-list')
  Future<Response> getBloodDonerList();

  @Get(path: '/blood/needed-list')
  Future<Response> getBloodNeededList();

  @Get(path: '/auth/user', headers: {'Accept': 'application/json'})
  Future<Response> getUser(@Header('Authorization') String token);

  @Get(path: '/products')
  Future<Response> getShopProducts();

  @Get(path: '/product/category')
  Future<Response> getShopCategories();

  @Get(path: '/emergency/doctor')
  Future<Response> getEmergencyDoctor();

  @Get(path: '/services')
  Future<Response> getAllServices();

  @Get(path: '/service/details/{id}')
  Future<Response> getServices(@Path() String id);

  @Get(path: '/my/appointment/{id}')
  Future<Response> getMyAppointments(@Path() String id);

  @Get(path: '/cart-item/{id}')
  Future<Response> getCartItems(@Path() String id);

  @Get(path: '/checkout/order/{id}')
  Future<Response> checkOut(@Path() String id);

  @Get(path: '/my/appointment-list/nurse/{id}')
  Future<Response> getNurseAppointments(@Path() String id);

  @Get(path: '/blog-post')
  Future<Response> getBlogs();

  //Post requests
  // @Post(path: '/withdrawalRequest')
  // Future<Response> sendWithdrawalRequest(@Query() String vendorID, @Body() String body);

  @Post(path: '/auth/login', headers: {'Content-Type': 'application/json'})
  Future<Response> login(@Body() String body);

  @Post(path: '/auth/register', headers: {'Content-Type': 'application/json'})
  Future<Response> register(@Body() String body);

  @Post(path: '/auth/logout', headers: {'Accept': 'application/json'})
  Future<Response> logOutUser(@Header('Authorization') String token);

  @Post(path: '/appointment')
  Future<Response> bookAppointment(@Query() String customerId, @Query() String doctorId, @Query() String hospitalId, @Query() String customerType, @Query() String appointmentDate, @Query() String appointmentTime, @Query() String customerInfo);

  @Post(path: '/appointment/nurse')
  Future<Response> bookNurseAppointment(@Query() String customerId, @Query() String nurseId, @Query() String hospitalId, @Query() String customerType, @Query() String appointmentDate, @Query() String appointmentTime, @Query() String customerInfo);

  @Post(path: '/add/blood/request', headers: {'Content-Type': 'application/json'})
  Future<Response> addBloodRequest(@Body() String body);

  @Post(path: '/auth/profile/update/{id}', headers: {'Accept': 'application/json', 'Content-Type': 'application/json'})
  Future<Response> updateUser(@Path() String id, @Body() String body, @Header('Authorization') String token);

  @Post(path: '/add-to-cart', headers: {'Content-Type': 'application/json'})
  Future<Response> addToCart(@Body() String body);

  @Post(path: '/cart-item/delete', headers: {'Content-Type': 'application/json'})
  Future<Response> deleteItemFromCart(@Body() String body);

  @Post(path: '/add/credit', headers: {'Content-Type': 'application/json'})
  Future<Response> addCredit(@Body() String body);
}
