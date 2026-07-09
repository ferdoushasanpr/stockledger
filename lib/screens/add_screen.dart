import 'package:flutter/material.dart';

enum FormType { product, customer }

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

  @override
  Widget build(BuildContext context) {
    final isProduct = widget.type == FormType.product;

    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131313),
        title: Text(
          isProduct ? "Add Product" : "Add Customer",
          style: const TextStyle(
            color: Color(0xFFE2AB00),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFE2AB00)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: decoration("Name"),
                validator: (value) => value!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 15),

              if (isProduct) ...[
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

              if (!isProduct) ...[
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

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE2AB00),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO:
                      // Save Product or Customer
                    }
                  },
                  child: Text(isProduct ? "Add Product" : "Add Customer"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
