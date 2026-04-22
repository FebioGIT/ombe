import 'package:flutter/material.dart';


import 'package:ombe_coffee/pages/order/delivery_tracking_page.dart';

class StoreLocationPage extends StatefulWidget {
  const StoreLocationPage({super.key});

  @override
  State<StoreLocationPage> createState() => _StoreLocationPageState();
}

class _StoreLocationPageState extends State<StoreLocationPage> {
  final Color primaryGreen = const Color(0xFF00704A); 
  final Color directionBlue = const Color(0xFF254EDB); 

  int _activeFilterIndex = 0;
  final List<String> _filters = ["Near Me", "Popular", "Top Rated"];

  
  final List<Map<String, dynamic>> _stores = [
    {
      "name": "Centre Point Plaza",
      "hours": "09:00 AM - 10:00 PM",
      "distance": "3,5 Km",
      "image": "assets/tempat1.png", 
    },
    {
      "name": "Indy Cafe & Roastery",
      "hours": "08:00 AM - 11:00 PM",
      "distance": "5,2 Km",
      "image": "assets/tempat1.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50, 
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
          "Our Stores",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search address",
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      suffixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 26),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _filters.length,
                    itemBuilder: (context, index) {
                      bool isActive = _activeFilterIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeFilterIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isActive ? primaryGreen : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isActive ? primaryGreen : primaryGreen,
                            ),
                          ),
                          child: Text(
                            _filters[index],
                            style: TextStyle(
                              color: isActive ? Colors.white : primaryGreen,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                  TextSpan(text: "We have "),
                  TextSpan(
                    text: "46",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " Outlets ready to serve you"),
                ],
              ),
            ),
          ),

          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: _stores.length,
              itemBuilder: (context, index) {
                return _buildStoreCard(context, _stores[index]); 
              },
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildStoreCard(BuildContext context, Map<String, dynamic> store) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none, 
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  store['image'],
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.store, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          store['hours'],
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: primaryGreen, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              store['distance'],
                              style: TextStyle(
                                color: primaryGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          
          Positioned(
            right: 16,
            top: 118, 
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: directionBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 2,
              ),
              icon: const Icon(Icons.info_outline, size: 18),
              label: const Text(
                "Directions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryTrackingPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}