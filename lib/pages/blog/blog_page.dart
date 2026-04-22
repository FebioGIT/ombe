import 'package:flutter/material.dart';
// Pastikan path import ini benar sesuai lokasi file blog_detail_page.dart Anda
import 'blog_detail_page.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = [
      "Coffee",
      "Black Coffee",
      "Cappuccino",
      "Espresso",
      "Cold brew",
      "Affogato",
      "Latte",
      "Americano",
    ];

    // DATA LIST SUDAH DIPERBAIKI
    // Judul disesuaikan dengan desain, dan gambar menggunakan kopi2.png
    // agar langsung muncul di HP Anda tanpa error.
    final List<Map<String, String>> blogs = [
      {
        "title": "Nature's Ingredients",
        "date": "October 4, 2022",
        "image": "assets/blogfoto.webp",
      },
      {
        "title": "Nature's Ingredients",
        "date": "September 3, 2022",
        "image": "assets/blogfoto.webp",
      },
      {
        "title": "Nature's Ingredients",
        "date": "October 1, 2022",
        "image": "assets/blogfoto.webp",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        title: const Text(
          "Blog",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey[400]),
                suffixIcon: Icon(Icons.search, color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Blog Tags",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: tags.map((tag) => _buildTag(tag)).toList(),
            ),
            const SizedBox(height: 25),
            // Menggunakan Column untuk List Blog agar tidak error scrolling
            Column(
              children: blogs.map((blog) {
                return _buildBlogCard(
                  context,
                  blog['title']!,
                  blog['date']!,
                  blog['image']!,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF00704A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

  Widget _buildBlogCard(
    BuildContext context,
    String title,
    String date,
    String imageUrl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BlogDetailPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors
              .grey[800], // Fallback color agar teks putih tetap terlihat jika error
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                0.5,
              ), // Sedikit digelapkan agar teks terbaca
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.white, fontSize: 12),
                children: [
                  const TextSpan(text: "By "),
                  const TextSpan(
                    text: "Admin ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: date),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
