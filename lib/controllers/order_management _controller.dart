import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/data/models/order_model.dart';
import 'package:jkmart/data/models/product_model.dart';
import 'package:jkmart/data/models/vendor_model.dart';
import 'package:jkmart/data/repositories/order_repository.dart';

class OrderManagementController extends GetxController {
  final OrderRepository repository;
  OrderManagementController({required this.repository});
  final String collectionId = "634f40a9c1be74eb6ae6";
  final String databaseId = "62dc4ad195fe6c0fe8c5";

  ///List of all order from server
  List<OrderModel> orders = [];
  List<VendorModel> vendors = [];
  List<ProductModel> products = [];

  ///This veriable shows if api is getting data
  RxBool isLoading = false.obs;

  ///This veriable shows if api is creating a new lottery data
  RxBool isAddingOrder = false.obs;
  RxBool isUpdatingOrder = false.obs;
  RxBool isExportingData = false.obs;

  ///Form key to validate all the fields of add order
  final formKey = GlobalKey<FormState>();

  Client client = Client();
  Databases? db;
  String? _error;
  String? get error => _error;

  //Add order form product selection index
  RxInt selectedProductIndex = 0.obs;
  Rx<DateTime> queryDate = DateTime.now().obs;

  int productHave = 0;
  int productNeed = 0;

  getOrders() async {
    isLoading.value = true;

    final result = await repository.getOrders();

    result.fold(
      (l) {
        Get.snackbar("Error", "Something went wrong");
      },
      (r) => orders = r,
    );

    isLoading.value = false;
  }

  // Future<void> getOrders() async {
  //   isLoading.value = true;

  //   // final result = await repository.getLotteries(queryDate: DateUtils.dateOnly(queryDate.value).compareTo(DateUtils.dateOnly(DateTime.now())) == 0 ? null : DateUtils.dateOnly(queryDate.value));
  //   final result = await repository.getOrders(queryDate: DateUtils.dateOnly(queryDate.value));

  //   result.fold((l) {
  //     if (l is NoConnectionFailure) {
  //       Get.snackbar("No connection", "Please check your internet connection");
  //     } else {
  //       Get.snackbar("Something went wrong", "Please try again later");
  //     }
  //   }, (r) {
  //     lotteries = r;
  //     totalSold = 0;
  //     for (var element in lotteries) {
  //       final elementsTotal = int.tryParse(element.total!);
  //       totalSold = totalSold + (elementsTotal ?? 0);
  //     }
  //   });

  //   await getGames();
  // }

  // Future<List<OrderModel>> getOrders() async {
  //   List<OrderModel> OrderList = [];
  //   try {
  //     DocumentList res = await db!.listDocuments(collectionId: collectionId);

  //     // if (res.statuscode != 200) {}
  //     for (var i = 0; i < res.documents.length; i++) {
  //       OrderList.add(OrderModel.fromJson(res.documents[i].data));
  //     }
  //     return OrderList;
  //   } on AppwriteException catch (e) {
  //     _error = e.message;
  //     print(e.message);
  //     return [];
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }
}
