import "package:flutter/material.dart";

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Product Name, SKU, Category..",
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
              "Add Product",
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 270,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white.withOpacity(.12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: AspectRatio(
                            aspectRatio: 1.45,
                            child: Image.network(
                              "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          "#SL-44102",
                          style: TextStyle(
                            color: Color(0xFFE0A800),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Aura ANC Pro Headphones",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            height: 1.15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Divider(
                          color: Colors.white.withOpacity(.12),
                          thickness: 1,
                          height: 1,
                        ),

                        const SizedBox(height: 16),

                        const Row(
                          children: [
                            Expanded(
                              child: _InfoSection(
                                label: "UNIT PRICE",
                                value: "\$349.00",
                                valueColor: Color(0xFFF2C15B),
                              ),
                            ),
                            Expanded(
                              child: _InfoSection(
                                label: "IN STOCK",
                                value: "42 Units",
                                valueColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 270,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white.withOpacity(.12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: AspectRatio(
                            aspectRatio: 1.45,
                            child: Image.network(
                              "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          "#SL-44102",
                          style: TextStyle(
                            color: Color(0xFFE0A800),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Aura ANC Pro Headphones",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            height: 1.15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Divider(
                          color: Colors.white.withOpacity(.12),
                          thickness: 1,
                          height: 1,
                        ),

                        const SizedBox(height: 16),

                        const Row(
                          children: [
                            Expanded(
                              child: _InfoSection(
                                label: "UNIT PRICE",
                                value: "\$349.00",
                                valueColor: Color(0xFFF2C15B),
                              ),
                            ),
                            Expanded(
                              child: _InfoSection(
                                label: "IN STOCK",
                                value: "42 Units",
                                valueColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _InfoSection({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(.55),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
