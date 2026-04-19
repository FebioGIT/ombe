import 'package:flutter/material.dart';
import '../../models/product.dart';

class CheckoutPage extends StatefulWidget {
  final Product product;
  final int quantity;

  const CheckoutPage({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  static const Color primary = Color(0xFF0C8A7B);

  int selectedMethod = 0;
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    final total = widget.product.price * widget.quantity;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text("Checkout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ================= PAYMENT =================
            _paymentHeader("Credit Card", 0),

            if (selectedMethod == 0) _creditCards(),

            _paymentHeader("Bank Transfer", 1),
            _paymentHeader("Virtual Account", 2),

            const Spacer(),

            // ================= BUTTON =================
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("PAY \$${total.toStringAsFixed(1)}"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= PAYMENT HEADER =================
  Widget _paymentHeader(String title, int index) {
    final isSelected = selectedMethod == index;

    return ListTile(
      leading: Radio(
        value: index,
        groupValue: selectedMethod,
        activeColor: primary,
        onChanged: (value) {
          setState(() {
            selectedMethod = value!;
          });
        },
      ),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(
          isSelected ? Icons.expand_less : Icons.expand_more),
    );
  }

  // ================= CREDIT CARDS =================
  Widget _creditCards() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCard = index;
              });
            },
            child: Container(
              width: 260,
              margin: const EdgeInsets.only(left: 16, bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: index == 0
                      ? [Colors.deepPurple, Colors.pinkAccent]
                      : [Colors.black87, Colors.grey],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selectedCard == index
                      ? primary
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Credit Card",
                      style: TextStyle(color: Colors.white)),

                  const Spacer(),

                  const Text("1234 **** **** ****",
                      style:
                          TextStyle(color: Colors.white, fontSize: 16)),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("04 / 25",
                          style: TextStyle(color: Colors.white70)),
                      Text("KEVIN HARD",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}