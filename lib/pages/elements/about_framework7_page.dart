import 'package:flutter/material.dart';

class AboutFramework7Page extends StatelessWidget {
  const AboutFramework7Page({super.key});

  final Color primaryGreen = const Color(0xFF00704A); // Hijau tema Ombe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Welcome to Framework7",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),
            const SizedBox(height: 16),
            _buildParagraph(
              "Framework7 - is a free and open source HTML mobile framework to develop hybrid mobile apps or web apps with iOS or Android (Material) native look and feel. It is also an indispensable prototyping apps tool to show working app prototype as soon as possible in case you need to. Framework7 is created by Vladimir Kharlampidi."
            ),
            const SizedBox(height: 20),
            _buildParagraph(
              "The main approach of the Framework7 is to give you an opportunity to create iOS and Android (Material) apps with HTML, CSS and JavaScript easily and clear. Framework7 is full of freedom. It doesn't limit your imagination or offer ways of any solutions somehow. Framework7 gives you freedom!"
            ),
            const SizedBox(height: 20),
            _buildParagraph(
              "Framework7 is not compatible with all platforms. It is focused only on iOS and Android (Material) to bring the best experience and simplicity."
            ),
            const SizedBox(height: 20),
            _buildParagraph(
              "Framework7 is definitely for you if you decide to"
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black87,
        height: 1.6, // Memberikan jarak antar baris yang nyaman dibaca
      ),
    );
  }
}