import "package:flutter/material.dart";
import "package:stockledger/widgets/report_cart.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE2AB00),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: const Text(
              "Add New Transaction",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE2AB00),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: const Text(
              "Transaction History",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 24),
          ReportCart(
            title: "TOTAL SALES",
            value: "\$124,592.00",
            icon: Icons.trending_up,
          ),
          SizedBox(height: 24),
          ReportCart(
            title: "TOTAL PRODUCTS",
            value: "1200",
            icon: Icons.production_quantity_limits,
          ),
          SizedBox(height: 24),
          ReportCart(
            title: "TOTAL CUSTOMERS",
            value: "1200",
            icon: Icons.people,
          ),
        ],
      ),
    );
  }
}
