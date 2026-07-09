import "package:flutter/material.dart";
import "package:stockledger/screens/add_screen.dart";

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Customer Name, Phone, Email..",
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddScreen(type: FormType.customer),
                ),
              );
            },
            icon: Icon(Icons.add, color: Colors.black87, size: 18),
            label: Text(
              "Add Customer",
              style: TextStyle(color: Colors.black87, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE2AB00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFFFC107), width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFFFFC107),
                      child: Text(
                        "JD",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Johnathan Doe",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "New York, USA",
                            style: TextStyle(
                              color: Color(0xFFBDBDBD),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4C4336),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: const Color(0xFF6B604F)),
                  ),
                  child: const Text(
                    "+1 (555) 012-3456",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "j.doe@architect-corp.com",
                  style: TextStyle(color: Color(0xFFD0D0D0), fontSize: 14),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      visualDensity: VisualDensity.compact,
                      splashRadius: 18,
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFFD7C3A1),
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      visualDensity: VisualDensity.compact,
                      splashRadius: 18,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFD7C3A1),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
