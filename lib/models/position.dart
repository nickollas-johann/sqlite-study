// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqlite_study/models/currency.dart';

class Position {
  Currency currency;
  double quantity;
  
  Position({
    required this.currency,
    required this.quantity,
  });
  
}
