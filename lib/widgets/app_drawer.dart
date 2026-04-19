import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final BuildContext context;

  const AppDrawer({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              "Ombe Coffee",
              style: TextStyle(fontSize: 20),
            ),
          ),

          _item(Icons.home, "Home"),
          _item(Icons.shopping_bag, "My Order"),
          _item(Icons.article, "Blog"),
          _item(Icons.favorite, "Wishlist"),
          _item(Icons.notifications, "Notifications"),
          _item(Icons.store, "Store Locations"),
          _item(Icons.local_shipping, "Delivery Tracking"),
          _item(Icons.card_giftcard, "Rewards"),
          _item(Icons.person, "Profile"),

          const Divider(),

          _item(Icons.settings, "Setting"),
          _item(Icons.logout, "Logout", isLogout: true),

          const SizedBox(height: 20),

          const Center(
            child: Column(
              children: [
                Text("Ombe Coffee App"),
                SizedBox(height: 4),
                Text("App Version 1.3",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title clicked")),
        );
      },
    );
  }
}