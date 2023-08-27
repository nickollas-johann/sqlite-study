import 'package:flutter/material.dart';
import 'package:sqlite_study/views/account_view.dart';
import 'package:sqlite_study/views/home_view.dart';
import 'package:sqlite_study/views/wallet_view.dart';

class HomeViewNavigation extends StatefulWidget {
  const HomeViewNavigation({super.key});

  @override
  State<HomeViewNavigation> createState() => _HomeViewNavigationState();
}

class _HomeViewNavigationState extends State<HomeViewNavigation> {
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndexPage = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Account'),
        ],
        
      ),
      body: [HomeView(), WalletView(), AccountView()][currentIndexPage]
    );
  }
}
