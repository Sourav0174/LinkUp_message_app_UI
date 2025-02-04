import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkup/domain/constants/app_colors.dart';
import 'package:linkup/repository/screens/widgets/ui_helper.dart';

class MoreScreen extends StatelessWidget {
  final String userName;
  MoreScreen({super.key, required this.userName});

  final List<Map<String, dynamic>> arrMore = [
    {"icon": Icons.person, "txt": "Account"},
    {"icon": CupertinoIcons.chat_bubble_fill, "txt": "Chats"},
    {"icon": Icons.notifications_active, "txt": "Notifications"},
    {"icon": Icons.color_lens, "txt": "Appearance"},
    {"icon": Icons.lock, "txt": "Privacy"},
    {"icon": Icons.help_outline, "txt": "Help & Support"},
    {"icon": Icons.info_outline, "txt": "About"}
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.scaffolddark : AppColors.scaffoldlight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: UiHelper.customText(
          text: "Profile",
          fontSize: 18,
          context: context,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mark_chat_unread_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.black26 : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.black54
                        : Colors.grey.withOpacity(0.3),
                    offset: Offset(4, 4),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.grey.withOpacity(0.1)
                        : Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: UiHelper.customImage(
                  imgUrl: isDarkMode ? "darkprofile.png" : "lightprofile.png",
                ),
                title: UiHelper.customText(
                  text: userName,
                  fontSize: 16,
                  context: context,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: arrMore.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.black26 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.black54
                              : Colors.grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 6,
                        ),
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.white,
                          offset: Offset(-2, -2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(
                        arrMore[index]["icon"],
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                      title: UiHelper.customText(
                        text: arrMore[index]["txt"],
                        fontSize: 14,
                        context: context,
                      ),
                      trailing: Icon(CupertinoIcons.forward,
                          color: isDarkMode ? Colors.white70 : Colors.black54),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
