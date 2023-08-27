import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_study/my_app.dart';
import 'package:sqlite_study/repository/account_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountRepository()),
      ],
      child: MyApp(),
    ),
    
  );
}
