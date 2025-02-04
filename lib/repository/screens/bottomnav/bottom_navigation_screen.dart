import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkup/domain/constants/app_colors.dart';
import 'package:linkup/repository/screens/bottomnav/chats/chat_screens.dart';
import 'package:linkup/repository/screens/bottomnav/contacts/contacts_screen.dart';
import 'package:linkup/repository/screens/bottomnav/more/more_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  final String userName;
  const BottomNavigationScreen({super.key, required this.userName});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      ChatScreens(),
      ContactsScreen(),
      MoreScreen(
        userName: widget.userName,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.scaffolddark
          : AppColors.scaffoldlight,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        selectedItemColor: isDarkMode ? Colors.white : Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble_fill,
              color: Color(0xFF343A40),
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2_alt, color: Color(0xFF343A40)),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF343A40)),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
