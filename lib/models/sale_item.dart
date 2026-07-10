class SaleItem {
  SaleItem({this.productId, this.quantity = 1, this.price = 0});

  int? productId;
  int quantity;
  int price;

  int get total => quantity * price;
}
