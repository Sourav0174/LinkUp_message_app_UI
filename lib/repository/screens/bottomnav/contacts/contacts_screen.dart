import 'package:flutter/material.dart';
import 'package:linkup/domain/constants/app_colors.dart';
import 'package:linkup/repository/screens/widgets/ui_helper.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key});

  final List<Map<String, String>> arrContacts = [
    {
      "img": "1.jpg",
      "name": "Athalia Putri",
      "msg": "Last seen yesterday",
      "date": "Today",
      "msgcount": "1",
    },
    {
      "img": "5.jpg",
      "name": "Erlan Sadewa",
      "msg": "Online",
      "date": "Today",
      "msgcount": "1",
    },
    {
      "img": "2.jpg",
      "name": "Midala Huera",
      "msg": "Last seen 3 hours ago",
      "date": "Today",
      "msgcount": "1",
    },
    {
      "img": "3.jpg",
      "name": "Nafisa Gitari",
      "msg": "Online",
      "date": "Today",
      "msgcount": "1",
    },
    {
      "img": "6.jpg",
      "name": "Raki Devon",
      "msg": "Online",
      "date": "Today",
      "msgcount": "1",
    },
    {
      "img": "4.jpg",
      "name": "Salsabila Akira",
      "msg": "Last seen 30 minutes ago",
      "date": "Today",
      "msgcount": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.scaffolddark
          : AppColors.scaffoldlight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: UiHelper.customText(
          text: "Contacts",
          fontSize: 16,
          context: context,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Search Bar with Neumorphism Design
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.scaffolddark
                    : AppColors.scaffoldlight,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: UiHelper.customTextField(
                controller: searchController,
                text: "Search",
                textInput: TextInputType.text,
                context: context,
                iconData: Icons.search,
              ),
            ),
            const SizedBox(height: 20),
            // Contact List
            Expanded(
              child: ListView.builder(
                itemCount: arrContacts.length,
                itemBuilder: (context, index) {
                  return _buildContactItem(context, arrContacts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(BuildContext context, Map<String, String> contact) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar with Neumorphism Design
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                "assets/images/${contact["img"]}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Contact Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.customText(
                  text: contact["name"]!,
                  fontSize: 16,
                  context: context,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                UiHelper.customText(
                  text: contact["msg"]!,
                  fontSize: 14,
                  context: context,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
          // Online Status Indicator
          if (contact["msg"] == "Online")
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
