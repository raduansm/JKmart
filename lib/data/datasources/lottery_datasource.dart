import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jkmart/data/models/lottery_model.dart';

class LotteryDataSource {
  final Databases db;
  final Client client;

  LotteryDataSource({required this.db, required this.client});

  final _collectionId = '634f40a9c1be74eb6ae6';
  final _uniqueId = 'unique()';

  Future<List<LotteryModel>> getLotteries() async {
    final response = await db.listDocuments(collectionId: _collectionId);

    final lotteries = List<LotteryModel>.from(response.documents.map((e) => LotteryModel.fromJson(e.data)));

    return lotteries;
  }

  Future<void> addLottery({required String serial, required String start, required String close, required String total}) async {
    final LotteryModel payload = LotteryModel(serial: serial, start: start, close: close, total: total);
    //After login function adding, this have to be removed
    //Start remove section
    Session? session;
    try {
      session = await Account(client).getSession(sessionId: 'current');
    } catch (e) {
      session = null;
    }

    if (session == null) await Account(client).createAnonymousSession();

    //End remove section

    final response = await db.createDocument(collectionId: _collectionId, documentId: _uniqueId, data: payload.toJson());
  }
}
