import "package:flutter/material.dart";
import "package:stockledger/screens/category_screen.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.loginHandler});

  final Function(bool) loginHandler;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginHandler() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username != "admin123" || password != "admin123") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Invalid username or password. Please try again.",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    widget.loginHandler(true);

    // Navigator.of(
    //   context,
    // ).push(MaterialPageRoute(builder: (context) => const CategoryScreen()));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x13131300),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "StockLedger",
                  style: TextStyle(
                    color: Color(0xFFFFBF00),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Inventory and Sales Management Systems",
                  style: TextStyle(
                    color: Color.fromARGB(255, 212, 197, 171),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    filled: true,
                    fillColor: Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white70),
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Username is required";
                    }

                    if (value.length < 4) {
                      return "Username must be at least 4 characters";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Color(0xFF1E1E1E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white70),
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    if (value.length < 4) {
                      return "Password must be at least 4 characters";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loginHandler,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFBF00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        2,
                      ), // Slightly rounded corners
                    ),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
