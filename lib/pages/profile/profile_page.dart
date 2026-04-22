import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Color primaryGreen = const Color(0xFF00704A); // Warna hijau khas Ombe Coffee

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
          "Profile",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: Colors.black87, size: 28),
            onPressed: () {
              // Aksi untuk edit profil
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // --- HEADER: AVATAR & NAMA ---
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/kurir.webp', // Ganti dengan path foto profil Anda
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 110,
                    height: 110,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.person, size: 60, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "William Smith",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "London, England",
              style: TextStyle(
                fontSize: 16,
                color: primaryGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),

            // --- INFORMASI KONTAK ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildContactItem(
                    icon: Icons.phone_outlined,
                    label: "Mobile Phone",
                    value: "+12 345 678 92",
                  ),
                  _buildContactItem(
                    icon: Icons.mail_outline,
                    label: "Email Address",
                    value: "example@gmail.com",
                  ),
                  _buildContactItem(
                    icon: Icons.location_on_outlined,
                    label: "Address",
                    value: "Franklin Avenue, Corner St.\nLondon, 24125151",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- MOST ORDERED SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Most Ordered",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // List Horizontal Most Ordered
            SizedBox(
              height: 110,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildMostOrderedCard(
                    "Creamy Latte\nCoffee",
                    "Beverages",
                    "assets/kopi2.png", // Ganti dengan path gambar kopi Anda
                  ),
                  _buildMostOrderedCard(
                    "Special Mocha\nBlend",
                    "Beverages",
                    "assets/kopi2.png", // Ganti dengan path gambar kopi Anda
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPER ---

  // Komponen untuk List Kontak (No HP, Email, Lokasi)
  Widget _buildContactItem({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.grey.shade50, // Abu-abu sangat terang
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryGreen, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Komponen untuk Kartu Most Ordered berwarna hijau
  Widget _buildMostOrderedCard(String title, String category, String imagePath) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 65,
            height: 65,
            fit: BoxFit.contain,
            errorBuilder: (c, e, s) => const Icon(Icons.coffee, color: Colors.white, size: 50),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.2,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    Icon(
                      Icons.open_in_new,
                      color: Colors.white.withOpacity(0.8),
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}