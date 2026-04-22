import 'package:flutter/material.dart';
// IMPORT HALAMAN BARU
import 'about_framework7_page.dart';
import 'not_found_page.dart';

class ElementsPage extends StatelessWidget {
  const ElementsPage({super.key});

  // --- WARNA TEMA ---
  final Color primaryGreen = const Color(0xFF00704A); // Hijau khas Ombe Coffee
  final Color surfacePink = const Color(0xFFFAF0F3); // Warna latar pink/abu muda

  @override
  Widget build(BuildContext context) {
    // --- DATA LIST ---
    // 'About Framework7' sudah dihapus dari array ini agar bisa berdiri sendiri
    final List<String> components = [
      'Accordion', 'Action Sheet', 'Appbar', 'Area Chart', 
      'Autocomplete', 'Badge', 'Buttons', 'Calendar / Date Picker', 'Cards', 
      'Cards Expandable', 'Checkbox', 'Chips / Tags', 'Color Picker', 'Contacts List', 
      'Content Block', 'Data Table', 'Dialog', 'Elevation', 'FAB', 'FAB Morph', 
      'Form Storage', 'Gauge', 'Grid / Layout Grid', 'Icons', 'Infinite Scroll', 
      'Inputs', 'Lazy Load', 'List View', 'List Index', 'Login Screen', 'Menu', 
      'Menu List', 'Messages', 'Navbar', 'Notifications', 'Panel / Side Panels', 
      'Photo Browser', 'Picker', 'Pie Chart', 'Popover', 'Popup', 'Preloader', 
      'Progress Bar', 'Pull To Refresh', 'Radio', 'Range Slider', 'Searchbar', 
      'Search Expandable', 'Sheet Modal', 'Skeleton (Ghost) Layouts', 'Smart Select', 
      'Sortable List', 'Stepper', 'Subnavbar', 'Swipeout (Swipe To Delete)', 
      'Swiper Slider', 'Tabs', 'Text Editor', 'Timeline', 'Toast', 'Toggle', 
      'Toolbar & Tabbar', 'Tooltip', 'Treeview', 'Virtual List'
    ];

    final List<String> themes = [
      'iOS Theme', 'Material (MD) Theme', 'Aurora Desktop Theme', 'Color Themes'
    ];

    final List<String> pageLoaders = [
      'Page Transitions', 'Component Page', 'Default Route (404)', 'Master-Detail (Split View)'
    ];

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
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // JUDUL HALAMAN
              const Text(
                "Framework7",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 25),

              // ABOUT (Berdiri sendiri di dalam kotak pink)
              _buildPinkCardContainer(
                // Tambahkan context di sini
                child: _buildGroupedItem(context, "About Framework7"),
              ),
              const SizedBox(height: 30),

              // SECTION: COMPONENTS
              _buildSectionTitle("Components"),
              const SizedBox(height: 15),
              _buildPinkCardContainer(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), 
                  itemCount: components.length,
                  itemBuilder: (context, index) {
                    // Tambahkan context di sini
                    return _buildGroupedItem(context, components[index]);
                  },
                ),
              ),
              const SizedBox(height: 35),

              // SECTION: THEMES
              _buildSectionTitle("Themes"),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: themes.length,
                itemBuilder: (context, index) {
                  // Tambahkan context di sini
                  return _buildStandardItem(context, themes[index]);
                },
              ),
              const SizedBox(height: 35),

              // SECTION: PAGE LOADERS & ROUTER
              _buildSectionTitle("Page Loaders & Router"),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pageLoaders.length,
                itemBuilder: (context, index) {
                  // Tambahkan context di sini
                  return _buildStandardItem(context, pageLoaders[index]);
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER ---

  // Membuat teks header untuk setiap section
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryGreen,
      ),
    );
  }

  // Membuat wadah/kotak dengan background pink muda dan sudut melengkung
  Widget _buildPinkCardContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: surfacePink,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  // Membuat custom icon kopi dengan garis kuning di bawahnya
  Widget _buildCustomCoffeeIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.local_cafe_outlined, 
          color: primaryGreen,
          size: 22,
        ),
        const SizedBox(height: 2),
        Container(
          height: 2,
          width: 14,
          decoration: BoxDecoration(
            color: Colors.amber.shade300, 
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  // Membuat baris item dengan ikon kopi kustom, ditambah navigasi
  Widget _buildGroupedItem(BuildContext context, String title) { // Context ditambahkan
    return InkWell(
      onTap: () {
        // LOGIKA NAVIGASI
        if (title == "About Framework7") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AboutFramework7Page()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NotFoundPage()),
          );
        }
      }, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            _buildCustomCoffeeIcon(), 
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  // Membuat baris item standar (Untuk Themes & Page Loaders), ditambah navigasi
  Widget _buildStandardItem(BuildContext context, String title) { // Context ditambahkan
    return InkWell(
      onTap: () {
        // Karena ini Themes dan Page Loaders, arahkan semua ke NotFoundPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NotFoundPage()),
        );
      }, 
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}