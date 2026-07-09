import "package:flutter/material.dart";
import "package:stockledger/screens/category_screen.dart";
import "package:stockledger/screens/customer_screen.dart";
import "package:stockledger/screens/home_screen.dart";
import "package:stockledger/screens/login_screen.dart";

class Stockledger extends StatefulWidget {
  const Stockledger({super.key});

  @override
  State<Stockledger> createState() => _StockledgerState();
}

class _StockledgerState extends State<Stockledger> {
  bool _isLoggedIn = false;
  int _selectedIndex = 0;

  final List _screens = [HomeScreen(), CustomerScreen(), CategoryScreen()];

  void _onTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void loginStateHandler(bool value) {
    setState(() {
      _isLoggedIn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return Scaffold(
        backgroundColor: Color(0x13131300),
        appBar: AppBar(
          title: const Text(
            "StockLedger",
            style: TextStyle(
              color: Color(0xFFE2AB00),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0x13131300),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isLoggedIn = false;
                });
              },
              icon: const Icon(Icons.logout, color: Color(0xFFE2AB00)),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.man), label: "Customers"),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTap,
        ),
        body: _screens[_selectedIndex],
      );
    } else {
      return LoginScreen(loginHandler: loginStateHandler);
    }
  }
}
