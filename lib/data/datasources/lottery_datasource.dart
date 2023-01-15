import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:jkmart/data/models/games_model.dart';
import 'package:jkmart/data/models/lottery_model.dart';

class LotteryDataSource {
  final Databases db;
  final Client client;

  LotteryDataSource({required this.db, required this.client});

  final _collectionId = '634f40a9c1be74eb6ae6';
  final _gameCollectionId = '63c1b85b51b2906cee26';
  final _uniqueId = 'unique()';

  Future<List<LotteryModel>> getLotteries({DateTime? queryDate}) async {
    final response = await db.listDocuments(
      collectionId: _collectionId,
      orderTypes: ["DESC"],
      orderAttributes: ["date"],
      queries: [
        if (queryDate != null) Query.equal("date", DateUtils.dateOnly(queryDate).toIso8601String()),
      ],
    );

    final lotteries = List<LotteryModel>.from(response.documents.map((e) => LotteryModel.fromJson(e.data)));

    return lotteries;
  }

  Future<void> addLottery({required String serial, required String start, required String close, required String total, required int gameId, required DateTime date}) async {
    final LotteryModel payload = LotteryModel(serial: serial, start: start, close: close, total: total, gameId: gameId, date: DateUtils.dateOnly(date).toIso8601String(), read: [], write: [], createdAt: date.isBefore(DateTime.now()) ? date.toUtc().millisecondsSinceEpoch : DateTime.now().toUtc().millisecondsSinceEpoch);
    //After login function added, this have to be removed
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

  Future<List<GamesModel>> getGames() async {
    final response = await db.listDocuments(collectionId: _gameCollectionId);

    final List<GamesModel> games = List<GamesModel>.from(response.documents.map((e) => GamesModel.fromJson(e.data)));

    return games;
  }
}
