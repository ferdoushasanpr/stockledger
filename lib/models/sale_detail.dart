class SaleDetail {
  const SaleDetail({
    required this.id,
    required this.saleId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  final int id;
  final int saleId;
  final int productId;
  final int quantity;
  final int price;
  final int totalPrice;
}
