import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Orders",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // --- SEARCH BAR ---
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search Order ID or Product",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),

              // --- FILTER TABS ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _buildFilterTab("All", isActive: true),
                    const SizedBox(width: 10),
                    _buildFilterTab("On Delivery"),
                    const SizedBox(width: 10),
                    _buildFilterTab("Done"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // --- ORDER LIST ---
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildOrderItem(
                      "Sweet Lemon Indonesian Tea",
                      "5.8",
                      "2x",
                      "11.6",
                      "https://images.unsplash.com/photo-1576092768241-dec231879fc3?q=80&w=200&auto=format&fit=crop",
                    ),
                    _buildOrderItem(
                      "Hot Cappuccino Latte with Mocha",
                      "8.6",
                      "1x",
                      "8.6",
                      "https://images.unsplash.com/photo-1534778101976-62847782c213?q=80&w=200&auto=format&fit=crop",
                    ),
                    _buildOrderItem(
                      "Arabica Latte Ombe Coffee",
                      "0.0", // Menyesuaikan gambar yang tidak terlihat harganya
                      "",
                      "",
                      "https://images.unsplash.com/photo-1541167760496-162955ed8a9f?q=80&w=200&auto=format&fit=crop",
                    ),
                    const SizedBox(height: 100), // Spacer agar tidak tertutup tombol
                  ],
                ),
              ),
            ],
          ),

          // --- FLOATING PLACE ORDER BUTTON ---
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00704A),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: const Text(
                "PLACE ORDER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget: Filter Tab
  Widget _buildFilterTab(String label, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF00704A) : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: isActive ? const Color(0xFF00704A) : const Color(0xFF00704A),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF00704A),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper Widget: Order Item Card
  Widget _buildOrderItem(String title, String price, String qty, String total, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      qty,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "\$$total",
                      style: const TextStyle(
                        fontSize: 18,
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
    );
  }
}