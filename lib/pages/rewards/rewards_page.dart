import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  // 1. STATE VARIABEL: Untuk menyimpan pilihan saat ini
  String _selectedSort = 'Newest';

  // 2. DATA DUMMY: Tanggal saya bedakan sedikit agar efek sorting terlihat
  List<Map<String, String>> historyData = [
    {
      "title": "Extra Deluxe Gayo Coffee Packages",
      "date": "June 18, 2020 | 4:00 AM",
      "points": "+250",
    },
    {
      "title": "Buy 10 Brewed Coffee Packages",
      "date": "June 17, 2020 | 4:00 AM",
      "points": "+100",
    },
    {
      "title": "Ice Coffee Morning",
      "date": "June 16, 2020 | 4:00 AM",
      "points": "+50",
    },
    {
      "title": "Hot Blend Coffee with Morning Cake",
      "date": "June 15, 2020 | 4:00 AM",
      "points": "+100",
    },
  ];

  // Fungsi untuk mensortir data
  void _sortData(String sortType) {
    setState(() {
      _selectedSort = sortType;
      if (sortType == 'Newest') {
        // Urutkan dari tanggal terbaru (asumsi data default sudah urut terbaru)
        historyData.sort((a, b) => b['date']!.compareTo(a['date']!));
      } else {
        // Urutkan dari tanggal terlama
        historyData.sort((a, b) => a['date']!.compareTo(b['date']!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Rewards",
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
            _buildPointsCard(),
            const SizedBox(height: 30),
            _buildHistoryHeader(),
            const SizedBox(height: 10),
            _buildHistoryList(),
          ],
        ),
      ),
    );
  }

  // --- WIDGET KOMPONEN ---

  Widget _buildPointsCard() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF00704A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: 10,
            child: Icon(
              Icons.eco_outlined,
              size: 120,
              color: Colors.yellow[100]?.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Points",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white.withOpacity(0.8),
                    )
                  ],
                ),
                const Text(
                  "87,550",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Redeem Gift",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "History Reward",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // 3. DROPDOWN MENU PENGGANTI TEXT STATIS
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedSort,
            icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF00704A)),
            style: const TextStyle(
              color: Color(0xFF00704A),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            items: <String>['Newest', 'Oldest'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                _sortData(newValue); // Panggil fungsi sortir saat diklik
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryList() {
    return Column(
      children: historyData.map((data) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title']!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data['date']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data['points']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00704A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Pts",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}