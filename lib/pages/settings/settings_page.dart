import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Local state untuk simulasi Dark Mode di halaman ini
  bool _isDarkMode = false;
  
  final Color primaryGreen = const Color(0xFF00704A);

  @override
  Widget build(BuildContext context) {
    // Definisi warna dinamis berdasarkan mode
    final Color bgColor = _isDarkMode ? const Color(0xFF121212) : const Color(0xFFF4F6F9);
    final Color cardColor = _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final Color textColor = _isDarkMode ? Colors.white : Colors.black87;
    final Color subtitleColor = _isDarkMode ? Colors.grey.shade400 : Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Link", style: TextStyle(color: textColor, fontSize: 16)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Color Themes",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textColor),
              ),
              const SizedBox(height: 30),

              // --- LAYOUT THEMES ---
              Text(
                "Layout Themes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryGreen),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Framework7 comes with 2 main layout themes: Light (default) and Dark:",
                      style: TextStyle(fontSize: 14, color: subtitleColor, height: 1.5),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        // Tombol Light Mode
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDarkMode = false;
                              });
                            },
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(12),
                              child: !_isDarkMode 
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: primaryGreen,
                                        borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: const Icon(Icons.check, color: Colors.white, size: 20),
                                    ) 
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Tombol Dark Mode
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDarkMode = true;
                              });
                            },
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(12),
                              child: _isDarkMode 
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: primaryGreen,
                                        borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: const Icon(Icons.check, color: Colors.white, size: 20),
                                    ) 
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- DEFAULT COLOR THEMES ---
              Text(
                "Default Color Themes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryGreen),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Framework7 comes with 12 color themes set.",
                      style: TextStyle(fontSize: 14, color: subtitleColor),
                    ),
                    const SizedBox(height: 20),
                    // Grid Warna
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildColorBtn("Red", const Color(0xFFE53935)),
                        _buildColorBtn("Green", const Color(0xFF00704A)),
                        _buildColorBtn("Blue", const Color(0xFF1E88E5)),
                        _buildColorBtn("Pink", const Color(0xFFD81B60)),
                        _buildColorBtn("Yellow", const Color(0xFFFBC02D), textColor: Colors.black),
                        _buildColorBtn("Orange", const Color(0xFFF57C00)),
                        _buildColorBtn("Purple", const Color(0xFF8E24AA)),
                        _buildColorBtn("Deeppurple", const Color(0xFF5E35B1)),
                        _buildColorBtn("Lightblue", const Color(0xFF039BE5)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar sesuai mockup
      bottomNavigationBar: Container(
        color: bgColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.email, "Inbox", true, textColor),
            _buildBottomNavItem(Icons.calendar_today, "Calendar", false, textColor, badgeCount: 5),
            _buildBottomNavItem(Icons.upload_file, "Upload", false, textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildColorBtn(String text, Color color, {Color textColor = Colors.white}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isActive, Color textColor, {int? badgeCount}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: isActive ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: isActive ? Colors.blue.shade800 : textColor.withOpacity(0.6)),
            ),
            if (badgeCount != null)
              Positioned(
                right: 8,
                top: -2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: isActive ? Colors.blue.shade800 : textColor.withOpacity(0.6), fontSize: 12),
        ),
      ],
    );
  }
}