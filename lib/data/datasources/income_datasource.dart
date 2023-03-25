import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jkmart/data/models/income_model.dart';
import 'package:jkmart/data/models/payment_type_model.dart';
import 'package:jkmart/data/models/vendor_model.dart';

class IncomeDataSource {
  final Databases db;
  final Client client;

  IncomeDataSource({required this.db, required this.client});

  final _collectionId = '636de2f5ab93330faeed';
  final _vendorCollectionId = '6414bc8f3b74957e61d6';
  final _paymentTypeCollectionId = '6414bcf32c864410e323';
  final _uniqueId = 'unique()';

  Future<List<IncomeModel>> getIncomes({String? vendorQuery, String? dateQuery, String? paymentTypeQuery}) async {
    final response = await db.listDocuments(
      collectionId: _collectionId,
      orderTypes: ["DESC"],
      orderAttributes: ["date"],
      queries: [
        vendorQuery != null ? Query.equal("vendor", vendorQuery) : Query.notEqual("vendor", ""),
        dateQuery != null ? Query.equal("date", dateQuery) : Query.notEqual("date", ""),
        paymentTypeQuery != null ? Query.equal("type", paymentTypeQuery) : Query.notEqual("type", ""),
      ],
    );

    final incomes = List<IncomeModel>.from(response.documents.map((e) => IncomeModel.fromJson(e.data)));

    return incomes;
  }

  Future<List<VendorModel>> getVendors() async {
    final response = await db.listDocuments(collectionId: _vendorCollectionId);

    final vendors = List<VendorModel>.from(response.documents.map((e) => VendorModel.fromJson(e.data)));

    return vendors;
  }

  Future<List<PaymentTypeModel>> getPaymentTypes() async {
    final response = await db.listDocuments(collectionId: _paymentTypeCollectionId);

    final paymentTypes = List<PaymentTypeModel>.from(response.documents.map((e) => PaymentTypeModel.fromJson(e.data)));

    return paymentTypes;
  }

  Future<void> addIncome({required String vendor, required String amount, required String date, required String type, required String paymentDetails}) async {
    final IncomeModel payload = IncomeModel(
      vendor: vendor,
      amount: amount,
      date: date,
      type: type,
      paymentDetails: paymentDetails,
    );

    await db.createDocument(collectionId: _collectionId, documentId: _uniqueId, data: payload.toJson());
  }
}
