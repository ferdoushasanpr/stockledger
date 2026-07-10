import 'package:flutter/material.dart';

class SaleItemView {
  const SaleItemView({
    required this.productName,
    required this.quantity,
    required this.price,
  });

  final String productName;
  final int quantity;
  final int price;

  int get subtotal => quantity * price;
}

class SaleMemoScreen extends StatelessWidget {
  const SaleMemoScreen({
    super.key,
    required this.saleId,
    required this.invoiceNo,
    required this.customerName,
    required this.saleDate,
    required this.items,
  });

  final int saleId;
  final String invoiceNo;
  final String customerName;
  final DateTime saleDate;
  final List<SaleItemView> items;

  int get grandTotal => items.fold(0, (sum, item) => sum + item.subtotal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),

      appBar: AppBar(
        backgroundColor: const Color(0xFF131313),
        iconTheme: const IconThemeData(color: Color(0xFFE2AB00)),
        title: const Text(
          "Sales Memo",
          style: TextStyle(
            color: Color(0xFFE2AB00),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Card(
          color: const Color(0xFF1E1E1E),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "SALES MEMO",
                    style: TextStyle(
                      color: Color(0xFFE2AB00),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                _info("Sale ID", saleId.toString()),
                _info("Invoice No.", invoiceNo),
                _info("Customer", customerName),
                _info(
                  "Sale Date",
                  "${saleDate.day}/${saleDate.month}/${saleDate.year}",
                ),

                const SizedBox(height: 25),

                const Divider(color: Colors.white24),

                const Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Product",
                        style: TextStyle(
                          color: Color(0xFFE2AB00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Qty",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE2AB00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Subtotal",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xFFE2AB00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const Divider(color: Colors.white24),

                ...items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),

                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            item.productName,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            item.quantity.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Text(
                            "৳${item.subtotal}",
                            textAlign: TextAlign.end,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(color: Colors.white24),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Grand Total",
                        style: TextStyle(
                          color: Color(0xFFE2AB00),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    Text(
                      "৳$grandTotal",
                      style: const TextStyle(
                        color: Color(0xFFE2AB00),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE2AB00),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),

                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },

                    child: const Text("Return Home"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _info(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(title, style: const TextStyle(color: Colors.white70)),
          ),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
