import 'package:flutter/material.dart';

import 'about_framework7_page.dart';
import 'not_found_page.dart';

class ElementsPage extends StatelessWidget {
  const ElementsPage({super.key});

  
  final Color primaryGreen = const Color(0xFF00704A); 
  final Color surfacePink = const Color(0xFFFAF0F3); 

  @override
  Widget build(BuildContext context) {
    
    
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
              
              const Text(
                "Framework7",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 25),

              
              _buildPinkCardContainer(
                
                child: _buildGroupedItem(context, "About Framework7"),
              ),
              const SizedBox(height: 30),

              
              _buildSectionTitle("Components"),
              const SizedBox(height: 15),
              _buildPinkCardContainer(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), 
                  itemCount: components.length,
                  itemBuilder: (context, index) {
                    
                    return _buildGroupedItem(context, components[index]);
                  },
                ),
              ),
              const SizedBox(height: 35),

              
              _buildSectionTitle("Themes"),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: themes.length,
                itemBuilder: (context, index) {
                  
                  return _buildStandardItem(context, themes[index]);
                },
              ),
              const SizedBox(height: 35),

              
              _buildSectionTitle("Page Loaders & Router"),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pageLoaders.length,
                itemBuilder: (context, index) {
                  
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

  
  Widget _buildPinkCardContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: surfacePink,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  
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

  
  Widget _buildGroupedItem(BuildContext context, String title) { 
    return InkWell(
      onTap: () {
        
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

  
  Widget _buildStandardItem(BuildContext context, String title) { 
    return InkWell(
      onTap: () {
        
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