import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  final Color primaryGreen = const Color(0xFF00704A);

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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Sunday, Feb 9, 12:58",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildChatBubble("Hi, Kate", true),
                _buildChatBubble("How are you?", true),
                // Panggilan ke fungsi avatar tetap sama
                _buildChatBubbleWithAvatar(
                  "Hi, I am good!",
                  false,
                  'assets/kurir.webp',
                ),
                _buildChatBubbleWithAvatar(
                  "Hi there, I am also fine, thanks! And how are you?",
                  false,
                  'assets/kurir.webp',
                ),
                _buildChatBubble("Hey, Blue Ninja! Glad to see you ;)", true),
              ],
            ),
          ),
          // Input Message
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Type message...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(Icons.send, color: primaryGreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isMe ? primaryGreen : const Color(0xFFFDE6C8),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isMe ? 20 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // DI SINI LETAK PERBAIKANNYA
  Widget _buildChatBubbleWithAvatar(String text, bool isMe, String img) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          CrossAxisAlignment.end, // Agar avatar sejajar di bawah teks
      children: [
        CircleAvatar(radius: 15, backgroundImage: AssetImage(img)),
        const SizedBox(width: 10),
        // WIDGET FLEXIBLE INI YANG MENCEGAH OVERFLOW
        Flexible(child: _buildChatBubble(text, isMe)),
      ],
    );
  }
}
