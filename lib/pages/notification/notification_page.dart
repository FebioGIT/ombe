import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final Color primaryGreen = const Color(0xFF00704A); 

  
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Apply Success",
      "body": "You have applied for a job in Queenify Group as UI Designer",
      "time": "10h ago",
      "isUnread": true,
      "showMarkAsRead": true,
    },
    {
      "title": "Interview Calls",
      "body": "Congratulations! You have interview calls tomorrow. Check schedule here..",
      "time": "4m ago",
      "isUnread": false,
      "showMarkAsRead": true,
    },
    {
      "title": "Apply Success",
      "body": "You have applied for a job in Queenify Group as UI Designer",
      "time": "8h ago",
      "isUnread": false,
      "showMarkAsRead": false,
    },
    {
      "title": "Complete your profile",
      "body": "Please verify your profile information to continue using this app",
      "time": "1d ago",
      "isUnread": false,
      "showMarkAsRead": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black87),
          ),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return _buildNotificationCard(
            title: item['title'],
            body: item['body'],
            time: item['time'],
            isUnread: item['isUnread'],
            showMarkAsRead: item['showMarkAsRead'],
            onMarkAsRead: () {
              setState(() {
                item['isUnread'] = false;
                item['showMarkAsRead'] = false;
              });
            },
          );
        },
      ),
    );
  }

  
  Widget _buildNotificationCard({
    required String title,
    required String body,
    required String time,
    required bool isUnread,
    required bool showMarkAsRead,
    required VoidCallback onMarkAsRead,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isUnread) ...[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: Colors.grey.shade400),
              const SizedBox(width: 6),
              Text(
                time,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
              const Spacer(),
              if (showMarkAsRead)
                GestureDetector(
                  onTap: onMarkAsRead,
                  child: Text(
                    "Mark as read",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: primaryGreen,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}