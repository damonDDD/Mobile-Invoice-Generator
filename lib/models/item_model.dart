class Item {
  String name;
  int qty;
  int vat;
  double price;
  Item({
    required this.name,
    required this.qty,
    required this.vat,
    required this.price,
  });
  List<String> toList() => [
        name,
        "$qty",
        "\$${price.toStringAsFixed(2)}",
        "$vat%",
        "${(price * ((vat+100)/100)*qty).toStringAsFixed(2)}"

      ];
}
