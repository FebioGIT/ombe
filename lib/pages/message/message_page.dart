import 'package:flutter/material.dart';
// IMPORT FILE CHAT DETAIL (Pastikan Anda membuat file chat_page.dart setelah ini)
import 'chat_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  final Color primaryGreen = const Color(0xFF00704A);

  @override
  Widget build(BuildContext context) {
    // Data dummy daftar pesan sesuai gambar
    final List<Map<String, dynamic>> chatList = [
      {
        "name": "Kevin Louis",
        "msg": "Hello William, Thankyou for your app",
        "time": "2m ago",
        "isOnline": false,
        "status": "",
      },
      {
        "name": "Olivia James",
        "msg": "OK. Lorem ipsum dolor sect...",
        "time": "2m ago",
        "isOnline": false,
        "status": "Unread",
      },
      {
        "name": "Cindy Sinambela",
        "msg": "OK. Lorem ipsum dolor sect...",
        "time": "2m ago",
        "isOnline": true,
        "status": "Pending",
      },
      {
        "name": "Sam Verdinand",
        "msg": "Roger that sir, thankyou",
        "time": "2m ago",
        "isOnline": true,
        "status": "Read",
      },
      {
        "name": "David Mckanzie",
        "msg": "Lorem ipsum dolor sit amet, consect...",
        "time": "2m ago",
        "isOnline": true,
        "status": "Read",
      },
      {
        "name": "Daphne Putri",
        "msg": "OK. Lorem ipsum dolor sect...",
        "time": "2m ago",
        "isOnline": true,
        "status": "",
      },
    ];

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
          "Messages",
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
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          // List Chat
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final item = chatList[index];
                return _buildChatItem(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        // NAVIGASI KE HALAMAN ISI CHAT (ChatPage)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar dengan status online
            Stack(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/kurir.webp'),
                ),
                if (item['isOnline'])
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 15),
            // Nama & Pesan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item['msg'],
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Waktu & Status
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item['time'],
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 5),
                if (item['status'] != "")
                  Row(
                    children: [
                      Text(
                        item['status'],
                        style: TextStyle(
                          color: item['status'] == 'Read'
                              ? Colors.green
                              : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        item['status'] == 'Read' ? Icons.done_all : Icons.done,
                        size: 16,
                        color: item['status'] == 'Read'
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
