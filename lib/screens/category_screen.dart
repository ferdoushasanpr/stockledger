import 'package:flutter/material.dart';
import 'package:stockledger/widgets/state_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Category Management",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Manage and organize your product classifications with precision.",
              style: TextStyle(color: Color(0xD4C5AB00)),
            ),
            SizedBox(height: 20),
            StateCard(),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Category Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white70, width: 2),
                ),
              ),
              style: TextStyle(color: Colors.white70),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.black87, size: 18),
              label: Text(
                "Add Category",
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE2AB00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text("ID", style: TextStyle(color: Colors.white)),
                    ),
                    DataColumn(
                      label: Text(
                        "Name",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Status",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(Text("#CAT-8801")),
                        DataCell(Text("Luxury Timepieces")),
                        DataCell(Text("Active")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("#CAT-8802")),
                        DataCell(Text("Precision Tools")),
                        DataCell(Text("Active")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("#CAT-8803")),
                        DataCell(Text("Archived Assets")),
                        DataCell(Text("Inactive")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("#CAT-8804")),
                        DataCell(Text("Computing Hardware")),
                        DataCell(Text("Active")),
                      ],
                    ),
                  ],
                  dataTextStyle: TextStyle(color: Colors.white70),
                  headingTextStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
