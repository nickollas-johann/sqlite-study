import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_study/database/db.dart';
import 'package:sqlite_study/models/position.dart';

class AccountRepository extends ChangeNotifier {
  late Database db;
  double _balance = 0;

  get balance => _balance;

  List<Position> _wallet = [];

  AccountRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getBalance();
  }

  _getBalance() async {
    db = await DB.instance.database;

    List account = await db.query('account', limit: 1);

    _balance = account.first['balance'];
    notifyListeners();
  }

  setBalance(double value) async {
    db = await DB.instance.database;
    db.update('account', {'balance': value});
  }
  
  
}