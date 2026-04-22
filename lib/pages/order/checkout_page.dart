import 'package:flutter/material.dart';


import 'package:ombe_coffee/pages/order/delivery_tracking_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  
  final Color primaryGreen = const Color(0xFF00704A);

  
  int _currentStep = 2; 
  
  
  String _selectedPaymentMethod = 'Virtual Account'; 
  
  
  String _selectedCountry = 'Choose your country';
  bool _isSaveAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomButton(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildHeader(context),
            const SizedBox(height: 30),
            
            _buildStepper(), 
            const SizedBox(height: 30),
            
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  
                  if (_currentStep == 0) 
                    ..._buildPaymentMethodList()
                  else if (_currentStep == 1) 
                    _buildShippingForm()
                  else if (_currentStep == 2)
                    _buildCouponForm(),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  
  

  Widget _buildStepper() => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          GestureDetector(
            onTap: () => setState(() => _currentStep = 0),
            child: Text(
              _currentStep == 0 ? "Payment Method" : "Payment ...", 
              style: TextStyle(
                fontWeight: _currentStep == 0 ? FontWeight.bold : FontWeight.normal,
                color: _currentStep == 0 ? Colors.black : Colors.grey.shade400,
              ),
            ),
          ),
          
          
          GestureDetector(
            onTap: () => setState(() => _currentStep = 1),
            child: Text(
              _currentStep == 1 ? "Shipping Address" : "Shipping A...", 
              style: TextStyle(
                fontWeight: _currentStep == 1 ? FontWeight.bold : FontWeight.normal,
                color: _currentStep == 1 ? Colors.black : Colors.grey.shade400,
              ),
            ),
          ),
          
          
          GestureDetector(
            onTap: () => setState(() => _currentStep = 2),
            child: Text(
              _currentStep == 2 ? "Coupon Apply" : "Coupon A...", 
              style: TextStyle(
                fontWeight: _currentStep == 2 ? FontWeight.bold : FontWeight.normal,
                color: _currentStep == 2 ? Colors.black : Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
      Stack(
        alignment: Alignment.center,
        children: [
          Container(height: 2, color: primaryGreen.withOpacity(0.2), margin: const EdgeInsets.symmetric(horizontal: 50)),
          
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: _currentStep == 0 
                ? Alignment.centerLeft 
                : (_currentStep == 1 ? Alignment.center : Alignment.centerRight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 20, width: 20,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  shape: BoxShape.circle, 
                  border: Border.all(color: primaryGreen, width: 4)
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  
  
  

  Widget _buildCouponForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel("Enter Coupon Code"),
        _buildTextField("#54856913215"),
      ],
    );
  }

  
  
  

  Widget _buildShippingForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel("Card Holder Name"),
        _buildTextField("Samuel Witwicky"),
        const SizedBox(height: 20),
        _buildFieldLabel("Zip/postal Code"),
        _buildTextField(""),
        const SizedBox(height: 20),
        _buildFieldLabel("Country"),
        _buildDropdownField(),
        const SizedBox(height: 20),
        _buildFieldLabel("State"),
        _buildTextField("Enter here"),
        const SizedBox(height: 20),
        _buildFieldLabel("City"),
        _buildTextField("Enter here"),
        const SizedBox(height: 25),
        _buildSaveAddressCheckbox(),
      ],
    );
  }

  
  
  

  List<Widget> _buildPaymentMethodList() {
    return [
      _buildPaymentSection(title: 'Credit Card', content: _buildCreditCardContent()),
      _buildPaymentSection(title: 'Bank Transfer', content: _buildBankTransferContent()),
      _buildPaymentSection(title: 'Virtual Account', content: _buildStandardFormFields()),
      const SizedBox(height: 40),
      const Divider(thickness: 1, color: Color(0xFFF2F2F2)),
      const SizedBox(height: 20),
      _buildTotalPayment(),
    ];
  }

  Widget _buildPaymentSection({required String title, required Widget content}) {
    bool isSelected = _selectedPaymentMethod == title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPaymentOption(
          title: title,
          value: title,
          trailing: Icon(isSelected ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.grey.shade400),
          onTapOverride: () {
            setState(() {
              _selectedPaymentMethod = isSelected ? "" : title;
            });
          },
        ),
        if (isSelected) Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: content),
      ],
    );
  }

  
  
  

  Widget _buildPaymentOption({required String title, required String value, required Widget trailing, VoidCallback? onTapOverride}) {
    bool isSelected = _selectedPaymentMethod == value;
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTapOverride,
        leading: Container(
          height: 24, width: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isSelected ? primaryGreen : Colors.grey.shade400, width: isSelected ? 7 : 2),
          ),
        ),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: trailing,
      ),
    );
  }

  Widget _buildCreditCardContent() {
    return Container(
      height: 190,
      margin: const EdgeInsets.only(bottom: 10),
      child: PageView(
        controller: PageController(viewportFraction: 0.9),
        padEnds: false,
        children: [
          _buildCard(color1: const Color(0xFF431181), color2: const Color(0xFFE89BA8), name: "KEVIN HARD"),
          _buildCard(color1: const Color(0xFF2C2C2C), color2: const Color(0xFF5A5A5A), name: "KEVIN HARD"),
        ],
      ),
    );
  }

  Widget _buildBankTransferContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStandardFormFields(),
        const SizedBox(height: 20),
        _buildFieldLabel("Country"),
        _buildDropdownField(),
        const SizedBox(height: 25),
        _buildSaveAddressCheckbox(),
      ],
    );
  }

  Widget _buildStandardFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel("Card Holder Name"),
        _buildTextField("Samuel Witwicky"),
        const SizedBox(height: 20),
        _buildFieldLabel("Card Number"),
        _buildTextField("1234 5678 9101 1121"),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildFieldLabel("Month/Year"), _buildTextField("Enter here")])),
            const SizedBox(width: 20),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildFieldLabel("CVV"), _buildTextField("Enter here")])),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({required Color color1, required Color color2, required String name}) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [color1, color2], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Credit Card", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Icon(Icons.circle, color: Colors.white.withOpacity(0.3), size: 30),
            ],
          ),
          const Text("1234 **** **** ****", style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("04 / 25", style: TextStyle(color: Colors.white70, fontSize: 14)),
              Text(name, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCountry,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: primaryGreen),
          onChanged: (val) => setState(() => _selectedCountry = val!),
          items: ['Choose your country', 'USA', 'China', 'India']
              
              .map((e) => DropdownMenuItem<String>(
                  value: e, 
                  child: Text(e, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
              ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSaveAddressCheckbox() {
    return Row(
      children: [
        SizedBox(
          height: 24, width: 24,
          child: Checkbox(
            value: _isSaveAddress,
            activeColor: primaryGreen,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onChanged: (val) => setState(() => _isSaveAddress = val!),
          ),
        ),
        const SizedBox(width: 12),
        const Text("Save shipping address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildFieldLabel(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(label, style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
  );

  Widget _buildTextField(String hint) => TextField(
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    decoration: InputDecoration(
      hintText: hint, 
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryGreen)),
    ),
  );

  Widget _buildHeader(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 50, width: 50,
            decoration: const BoxDecoration(color: Color(0xFFF2F2F2), shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        const Text("Checkout", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Icon(Icons.more_vert),
      ],
    ),
  );

  Widget _buildTotalPayment() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text("Total Payment", style: TextStyle(fontSize: 18, color: Colors.grey.shade500, fontWeight: FontWeight.w500)),
      const Text("\$158.0", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
    ],
  );

  Widget _buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryGreen,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          ),
          onPressed: () {
            setState(() {
              
              if (_currentStep < 2) {
                _currentStep++;
              } else {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeliveryTrackingPage()),
                );
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("NEXT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2)),
                const Icon(Icons.play_arrow, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}