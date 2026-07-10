import 'package:flutter/material.dart';
import 'package:stockledger/constants/app_colors.dart';
import 'package:stockledger/widgets/state_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            style: TextStyle(color: AppColors.primary),
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
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Card(
                color: AppColors.card, // Dark aesthetic background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DataTable(
                    headingTextStyle: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                    dataTextStyle: const TextStyle(color: Colors.white70),
                    columns: const [
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Status")),
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
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
