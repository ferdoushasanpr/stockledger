import "package:flutter/material.dart";

class ReportCart extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ReportCart({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFFA0A0A0),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(),
              Icon(icon, color: Colors.amber.shade600, size: 18),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "+12.5%",
                  style: TextStyle(
                    color: Color(0xFFF6D365),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: " from last month",
                  style: TextStyle(color: Color(0xFFD0D0D0), fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
