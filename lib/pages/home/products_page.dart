import 'package:flutter/material.dart';

// --- MODEL DATA PRODUK ---
class Product {
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imagePath;
  final String category;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.category,
  });
}

class ProductsPage extends StatefulWidget {
  final String initialCategory;

  const ProductsPage({super.key, required this.initialCategory});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  final Color primaryGreen = const Color(0xFF00704A);
  final Color starOrange = const Color(0xFFF78B33);
  final Color lightGreenBtn = const Color(0xFFE0F2F1);

  // Daftar kategori yang tersedia
  final List<String> categories = [
    "Beverages",
    "Foods",
    "Pizza",
    "Drink",
    "Lunch",
    "Burger"
  ];

  // Data Dummy Produk
  final List<Product> allProducts = [
    Product(
      name: "Sweet Lemon Indonesian Tea",
      description: "Tea, Lemon",
      price: 12.6,
      rating: 3.8,
      imagePath: "assets/kopi2.png",
      category: "Beverages",
    ),
    Product(
      name: "Hot Cappuccino Latte with Mocha",
      description: "Coffee",
      price: 8.6,
      rating: 3.8,
      imagePath: "assets/kopi2.png",
      category: "Beverages",
    ),
    Product(
      name: "Arabica Latte Ombe Coffee",
      description: "Coffee",
      price: 12.6,
      rating: 4.5,
      imagePath: "assets/kopi2.png",
      category: "Beverages",
    ),
    Product(
      name: "Classic Beef Burger",
      description: "Beef, Cheese",
      price: 10.5,
      rating: 4.2,
      imagePath: "assets/kopi2.png",
      category: "Foods",
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Menentukan index awal berdasarkan kategori yang diklik dari Home Page
    int initialIndex = categories.indexOf(widget.initialCategory);
    if (initialIndex == -1) initialIndex = 0;

    _tabController = TabController(
      length: categories.length,
      vsync: this,
      initialIndex: initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black87),
          ),
        ),
        title: const Text(
          "Products",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          
          // --- SEARCH BAR ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search beverages or foods",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // --- TAB BAR KATEGORI ---
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: primaryGreen,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryGreen,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            tabs: categories.map((cat) => Tab(text: cat)).toList(),
          ),
          
          // --- TAB VIEW ISI PRODUK ---
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((catName) {
                final filteredList = allProducts.where((p) => p.category == catName).toList();
                
                if (filteredList.isEmpty) {
                  return const Center(child: Text("No items available"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return _buildProductItem(filteredList[index]);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar & Rating Tag
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  product.imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(
                    width: 100, height: 100, color: Colors.grey.shade200,
                    child: const Icon(Icons.coffee),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: starOrange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        "${product.rating}",
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 25),
          // Info Teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.2),
                ),
                const SizedBox(height: 6),
                Text(
                  product.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightGreenBtn,
                        foregroundColor: primaryGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      icon: const Icon(Icons.shopping_bag_outlined, size: 18),
                      label: const Text("Buy", style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {},
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