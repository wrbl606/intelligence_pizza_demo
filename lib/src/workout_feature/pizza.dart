const pizzas = [
  // Classic Pizzas
  Pizza(id: 'P001', name: 'Margherita', price: 12),
  Pizza(id: 'P002', name: 'Pepperoni', price: 14),
  Pizza(id: 'P003', name: 'Four Cheese', price: 13),
  Pizza(id: 'P004', name: 'Hawaiian', price: 15),

  // Gourmet Pizzas
  Pizza(id: 'G001', name: 'Prosciutto & Arugula', price: 18),
  Pizza(id: 'G002', name: 'BBQ Chicken', price: 19),
  Pizza(id: 'G003', name: 'Spinach & Artichoke', price: 20),
];

class Pizza {
  final String id, name;
  final int price;

  const Pizza({
    required this.id,
    required this.name,
    required this.price,
  });
}

extension Asset on Pizza {
  String get assetPath => 'assets/images/$id.jpg';
}
