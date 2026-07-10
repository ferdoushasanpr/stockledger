import 'package:flutter/material.dart';
import 'package:stockledger/constants/app_colors.dart';
import 'package:stockledger/models/sale_item.dart';
import 'package:stockledger/screens/sale_memo_screen.dart';

enum FormType { product, customer, sale }

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.type});

  final FormType type;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  final _codeController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _stockController = TextEditingController();
  final _categoryController = TextEditingController();

  int? _selectedCustomerId;

  final List<SaleItem> _saleItems = [];

  final customers = [
    {"id": 1, "name": "John"},
    {"id": 2, "name": "Alex"},
  ];

  final products = [
    {"id": 1, "name": "Laptop", "price": 500},
    {"id": 2, "name": "Mouse", "price": 25},
    {"id": 3, "name": "Keyboard", "price": 40},
  ];

  String _status = "Active";

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();

    _codeController.dispose();
    _purchasePriceController.dispose();
    _sellingPriceController.dispose();
    _stockController.dispose();
    _categoryController.dispose();

    super.dispose();
  }

  InputDecoration decoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  String get title {
    switch (widget.type) {
      case FormType.product:
        return "Add Product";
      case FormType.customer:
        return "Add Customer";
      case FormType.sale:
        return "Add Sale";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (widget.type != FormType.sale) ...[
                TextFormField(
                  controller: _nameController,
                  decoration: decoration("Name"),
                  validator: (value) => value!.isEmpty ? "Required" : null,
                ),
              ],

              const SizedBox(height: 15),

              if (widget.type == FormType.product) ...[
                TextFormField(
                  controller: _codeController,
                  decoration: decoration("Product Code"),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: _categoryController,
                  keyboardType: TextInputType.number,
                  decoration: decoration("Category ID"),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: _purchasePriceController,
                  keyboardType: TextInputType.number,
                  decoration: decoration("Purchase Price"),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: _sellingPriceController,
                  keyboardType: TextInputType.number,
                  decoration: decoration("Selling Price"),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: _stockController,
                  decoration: decoration("Stock"),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: _status,
                  decoration: decoration("Status"),
                  dropdownColor: Colors.grey[900],
                  items: const [
                    DropdownMenuItem(value: "Active", child: Text("Active")),
                    DropdownMenuItem(
                      value: "Inactive",
                      child: Text("Inactive"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _status = value!;
                    });
                  },
                ),
              ],

              if (widget.type == FormType.customer) ...[
                TextFormField(
                  controller: _emailController,
                  decoration: decoration("Email"),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: decoration("Phone"),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: _addressController,
                  maxLines: 3,
                  decoration: decoration("Address"),
                ),
              ],

              if (widget.type == FormType.sale) ...[
                DropdownButtonFormField<int>(
                  decoration: decoration("Customer"),
                  value: _selectedCustomerId,
                  items: customers.map((customer) {
                    return DropdownMenuItem<int>(
                      value: customer["id"] as int,
                      child: Text(customer["name"].toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCustomerId = value;
                    });
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _saleItems.add(SaleItem());
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Product"),
                ),

                const SizedBox(height: 20),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _saleItems.length,
                  itemBuilder: (context, index) {
                    final item = _saleItems[index];

                    return Card(
                      color: AppColors.card,
                      margin: const EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            DropdownButtonFormField<int>(
                              value: item.productId,
                              dropdownColor: AppColors.card,
                              decoration: decoration("Product"),
                              style: const TextStyle(color: Colors.white),
                              items: products.map((product) {
                                return DropdownMenuItem<int>(
                                  value: product["id"] as int,
                                  child: Text(
                                    product["name"].toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                final product = products.firstWhere(
                                  (p) => p["id"] == value,
                                );

                                setState(() {
                                  item.productId = value;
                                  item.price = product["price"] as int;
                                });
                              },
                            ),

                            const SizedBox(height: 15),

                            TextFormField(
                              initialValue: item.quantity.toString(),
                              keyboardType: TextInputType.number,
                              decoration: decoration("Quantity"),
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) {
                                setState(() {
                                  item.quantity = int.tryParse(value) ?? 1;
                                });
                              },
                            ),

                            const SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Price",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  "৳ ${item.price}",
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  "৳ ${item.total}",
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            const Divider(color: Colors.white24),

                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _saleItems.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO:
                      // Save Product or Customer
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SaleMemoScreen(
                          saleId: 15,
                          invoiceNo: "INV-000015",
                          customerName: "John Doe",
                          saleDate: DateTime.now(),
                          items: const [
                            SaleItemView(
                              productName: "Laptop",
                              quantity: 2,
                              price: 800,
                            ),
                            SaleItemView(
                              productName: "Mouse",
                              quantity: 3,
                              price: 20,
                            ),
                            SaleItemView(
                              productName: "Keyboard",
                              quantity: 1,
                              price: 40,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(title),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
