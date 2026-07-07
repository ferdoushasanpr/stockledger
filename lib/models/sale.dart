class Sale {
  const Sale({
    required this.id,
    required this.invoiceNo,
    required this.customerId,
    required this.saleDate,
    required this.grandTotal,
  });

  final int id;
  final String invoiceNo;
  final int customerId;
  final String saleDate;
  final int grandTotal;
}
