import 'package:flutter/material.dart';
import 'login_page.dart';

class LoginChoicePage extends StatelessWidget {
  const LoginChoicePage({super.key});

  static const Color primary = Color(0xFF0C8A7B);
  static const Color background = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),

              
              const Icon(Icons.local_cafe, size: 80, color: primary),

              const SizedBox(height: 12),

              
              const Text(
                "Ombe",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Coffee Shop App",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

              
              const Text(
                "Morning begins with Ombe coffee",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 50),

              
              _button(
                context: context,
                text: "Login With Email",
                color: primary,
                textColor: Colors.white,
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 16),

              
              _button(
                context: context,
                text: "Login With Facebook",
                color: const Color(0xFF4267B2),
                textColor: Colors.white,
                icon: Icons.facebook,
              ),

              const SizedBox(height: 16),

              
              _button(
                context: context,
                text: "Login With Google",
                color: Colors.white,
                textColor: Colors.black,
                icon: Icons.g_mobiledata,
                border: true,
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  
  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

  
  Widget _button({
    required BuildContext context,
    required String text,
    required Color color,
    required Color textColor,
    required IconData icon,
    bool border = false,
  }) {
    return InkWell(
      onTap: () => _goToLogin(context),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: border ? Border.all(color: Colors.grey.shade300) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}