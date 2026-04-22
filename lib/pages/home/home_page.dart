import 'package:flutter/material.dart';
import 'package:ombe_coffee/pages/order/my_order_page.dart';
import 'package:ombe_coffee/pages/blog/blog_page.dart';
import 'package:ombe_coffee/pages/blog/blog_detail_page.dart';
import 'package:ombe_coffee/pages/rewards/rewards_page.dart';
import 'package:ombe_coffee/pages/elements/elements_page.dart';
import 'package:ombe_coffee/pages/notification/notification_page.dart';
import 'package:ombe_coffee/pages/store/store_location_page.dart';
import 'package:ombe_coffee/pages/wishlist/wishlist_page.dart';
import 'package:ombe_coffee/pages/profile/profile_page.dart';
import 'package:ombe_coffee/pages/order/order_detail_page.dart';
import 'package:ombe_coffee/pages/order/delivery_tracking_page.dart';
import 'package:ombe_coffee/pages/message/message_page.dart'; // Sesuaikan path jika berbeda
import 'package:ombe_coffee/pages/order/order_review_page.dart'; // Sesuaikan folder Anda
import 'package:ombe_coffee/pages/auth/login_choice_page.dart';
import 'products_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ScaffoldKey untuk membuka drawer dari tombol custom
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.coffee, 'title': 'Beverages', 'count': '67 Menus'},
      {'icon': Icons.fastfood, 'title': 'Foods', 'count': '23 Menus'},
      {'icon': Icons.local_pizza, 'title': 'Pizza', 'count': '28 Menus'},
      {'icon': Icons.local_bar, 'title': 'Drink', 'count': '12 Menus'},
      {'icon': Icons.lunch_dining, 'title': 'Lunch', 'count': '67 Menus'},
    ];

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      // --- DRAWER SECTION ---
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.coffee_maker,
                          color: Color(0xFF00704A),
                          size: 40,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Ombe",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(indent: 20, endIndent: 20),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    _buildDrawerItem(
                      context,
                      Icons.home_outlined,
                      "Home",
                      isSelected: true,
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.shopping_cart_outlined,
                      "My Order",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyOrdersPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.assignment_outlined,
                      "Blog",
                      isSelected: false,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BlogPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.assignment_outlined,
                      "Blog Detail",
                      isSelected: false,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BlogDetailPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.favorite_border,
                      "Wishlist",
                      onTap: () {
                        Navigator.pop(context); // Menutup drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WishlistPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.notifications_none,
                      "Notifications (2)",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.location_on_outlined,
                      "Store Locations",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StoreLocationPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.history,
                      "Delivery Tracking",
                      onTap: () {
                        Navigator.pop(context); // Tutup sidebar
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeliveryTrackingPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.storefront_outlined,
                      "Rewards",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RewardsPage(),
                          ),
                        );
                      },
                    ),
                    // NAVIGASI PROFIL DITAMBAHKAN DI SINI
                    _buildDrawerItem(
                      context,
                      Icons.person_outline,
                      "Profile",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.star_border,
                      "Order Review",
                      onTap: () {
                        Navigator.pop(context); // Tutup sidebar
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderReviewPage(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.chat_bubble_outline,
                      "Message",
                      onTap: () {
                        Navigator.pop(context); // Tutup sidebar dulu
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MessagePage(), // Pakai class ini
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      Icons.grid_view,
                      "Elements",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ElementsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildDrawerItem(
                      context,
                      Icons.power_settings_new,
                      "Logout",
                      color: Colors.red,
                      onTap: () {
                        // Menutup sidebar terlebih dahulu
                        Navigator.pop(context);

                        // Navigasi ke halaman pilihan login dan menghapus semua tumpukan halaman sebelumnya
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginChoicePage(), // Pastikan nama class-nya benar
                          ),
                          (route) =>
                              false, // Parameter ini memastikan user tidak bisa menekan tombol 'back' untuk kembali ke Home
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Ombe Coffee App",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "App Version 1.3",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // --- BODY SECTION ---
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Header: Greeting & Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Good Morning",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "Williams",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyOrdersPage(),
                          ),
                        ),
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                          color: Color(0xFF00704A),
                        ),
                      ),
                      IconButton(
                        onPressed: () => scaffoldKey.currentState?.openDrawer(),
                        icon: const Icon(Icons.menu, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search beverages or foods",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Promo Cards Horizontal
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildPromoCard(
                      context,
                      "Creamy Ice Coffee",
                      "5.8",
                      "9.9",
                      "assets/kopi2.png",
                      const Color(0xFF00704A),
                    ),
                    _buildPromoCard(
                      context,
                      "Indonesian Tea",
                      "2.5",
                      "5.4",
                      "assets/kopi2.png",
                      const Color(0xFF00704A),
                    ),
                    _buildPromoCard(
                      context,
                      "Mocha Deluxe",
                      "6.2",
                      "10.0",
                      "assets/kopi2.png",
                      const Color(0xFF00704A),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              // Categories Horizontal
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return _buildCategoryCard(
                      context, // Jangan lupa context ini
                      item['icon'] as IconData, // <-- Tambahkan 'as IconData'
                      item['title'] as String,  // <-- Tambahkan 'as String'
                      item['count'] as String,  // <-- Tambahkan 'as String'
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              // Featured Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Beverages",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "More",
                      style: TextStyle(color: Color(0xFF00704A)),
                    ),
                  ),
                ],
              ),
              _buildFeaturedItem(
                context,
                "Hot Creamy Cappuccino",
                "12.6",
                "50 Pts",
                "3.8",
                "assets/kopi2.png",
              ),
              _buildFeaturedItem(
                context,
                "Creamy Mocha Ombe",
                "12.6",
                "50 Pts",
                "3.8",
                "assets/kopi2.png",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isSelected = false,
    Color color = Colors.grey,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xFF00704A) : color,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF00704A) : color.withOpacity(0.8),
          fontSize: 18,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap ?? () {},
    );
  }

  Widget _buildPromoCard(
    BuildContext context,
    String title,
    String price,
    String oldPrice,
    String imagePath,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderDetailPage()),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 10,
              child: Image.asset(
                imagePath,
                height: 120,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.coffee, color: Colors.white, size: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "\$ $price",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "\$ $oldPrice",
                        style: const TextStyle(
                          color: Colors.white70,
                          decoration: TextDecoration.lineThrough,
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
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, // Pastikan ada parameter context
    IconData icon,
    String title,
    String count,
  ) {
    return GestureDetector(
      onTap: () {
        // NAVIGASI KE PRODUCTS PAGE
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsPage(initialCategory: title),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF00704A), size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    count,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedItem(
    BuildContext context,
    String title,
    String price,
    String pts,
    String rating,
    String imagePath,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderDetailPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.white, size: 14),
                        Text(
                          rating,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        pts,
                        style: const TextStyle(
                          color: Color(0xFF00704A),
                          fontWeight: FontWeight.bold,
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
    );
  }
}
