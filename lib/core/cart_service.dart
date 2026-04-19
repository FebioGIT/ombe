import '../models/product.dart';

class CartService {
  static final List<Product> _items = [];

  // GETTER (INI YANG ERROR TADI)
  static List<Product> get items => _items;

  // TAMBAH ITEM
  static void add(Product product) {
    _items.add(product);
  }

  // HAPUS ITEM
  static void remove(Product product) {
    _items.remove(product);
  }

  // TOTAL HARGA
  static double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  // CLEAR CART
  static void clear() {
    _items.clear();
  }
}