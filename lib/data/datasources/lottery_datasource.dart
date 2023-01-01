import 'package:appwrite/appwrite.dart';
import 'package:jkmart/screens/lottery/model/lottery_model.dart';

class LotteryDataSource {
  final Databases db;

  LotteryDataSource({required this.db});

  Future<List<LotteryModel>> getLotteries() async {
    final response = await db.listDocuments(collectionId: '634f40a9c1be74eb6ae6');

    List<LotteryModel> lotteryList = [];

    for (var element in response.documents) {
      lotteryList.add(LotteryModel.fromJson(element.data));
    }

    return lotteryList;
  }
}
