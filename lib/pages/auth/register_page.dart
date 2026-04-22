import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscurePassword = true;

  static const Color primary = Color(0xFF0C8A7B);
  static const Color background = Color(0xFFF5F5F5);
  static const Color greyButton = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                
                Row(
                  children: const [
                    Icon(Icons.local_cafe, color: primary),
                    SizedBox(width: 8),
                    Text(
                      "Ombe",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                
                const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 30),

                
                const Text("Username", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),

                const TextField(
                  decoration: InputDecoration(
                    hintText: "Roberto Karlos",
                    border: UnderlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                
                const Text("Email", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),

                const TextField(
                  decoration: InputDecoration(
                    hintText: "example@gmail.com",
                    border: UnderlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                
                const Text("Password", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),

                TextField(
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greyButton,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Account created successfully"),
                        ),
                      );

                      Navigator.pop(context);
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                
                const Center(
                  child: Text.rich(
                    TextSpan(
                      text: "By tapping Sign up you accept all our ",
                      children: [
                        TextSpan(
                          text: "terms",
                          style: TextStyle(color: primary),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "condition",
                          style: TextStyle(color: primary),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}