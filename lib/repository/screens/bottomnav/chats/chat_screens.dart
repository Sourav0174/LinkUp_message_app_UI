import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkup/domain/constants/app_colors.dart';
import 'package:linkup/repository/screens/widgets/ui_helper.dart';
import 'package:lottie/lottie.dart';

class ChatScreens extends StatelessWidget {
  ChatScreens({super.key});

  final List<Map<String, String>> arrChat = [
    {
      "img": "1.jpg",
      "name": "Athalia Putri",
      "msg": "Hii",
      "date": "Today",
      "msgcount": "1"
    },
    {
      "img": "5.jpg",
      "name": "Erlan Sadewa",
      "msg": "Can we meet tomorrow!",
      "date": "Today",
      "msgcount": "1"
    },
    {
      "img": "2.jpg",
      "name": "Midala Huera",
      "msg": "Hii, Sourav...",
      "date": "Today",
      "msgcount": "1"
    },
    {
      "img": "3.jpg",
      "name": "Nafisa Gitari",
      "msg": "Let's build something great!",
      "date": "Today",
      "msgcount": "1"
    },
    {
      "img": "6.jpg",
      "name": "Raki Devon",
      "msg": "Thanks for the help!",
      "date": "Today",
      "msgcount": "1"
    },
    {
      "img": "4.jpg",
      "name": "Salsabila Akira",
      "msg": "Nice to meet you!",
      "date": "Today",
      "msgcount": "1"
    },
  ];

  late final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.scaffolddark
          : AppColors.scaffoldlight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: UiHelper.customText(
            text: "Chats",
            fontSize: 16,
            context: context,
            fontWeight: FontWeight.bold),
        actions: const [
          IconButton(
              onPressed: null, icon: Icon(Icons.mark_chat_unread_outlined)),
          IconButton(onPressed: null, icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // Lottie Animation for "Add Story"
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.scaffolddark
                                    : AppColors.scaffoldlight,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Lottie.asset(
                            "assets/animation/add_story.json",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        UiHelper.customText(
                          text: "Your Story",
                          fontSize: 12,
                          context: context,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  _buildStoryAvatar(context, "1.jpg", "Sourav"),
                  _buildStoryAvatar(context, "4.jpg", "Elai"),
                  _buildStoryAvatar(context, "3.jpg", "Aric"),
                  _buildStoryAvatar(context, "2.jpg", "Simmi"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            UiHelper.customTextField(
              controller: searchController,
              text: "Search",
              textInput: TextInputType.text,
              context: context,
              iconData: Icons.search,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: arrChat.length,
                itemBuilder: (context, index) {
                  return _buildChatItem(context, arrChat[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStoryAvatar(BuildContext context, String img, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.scaffolddark
                  : AppColors.scaffoldlight,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset("assets/images/$img", fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          UiHelper.customText(
            text: name,
            fontSize: 12,
            context: context,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, Map<String, String> chat) {
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
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset("assets/images/${chat["img"]}",
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.customText(
                  text: chat["name"]!,
                  fontSize: 16,
                  context: context,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.textdarkmode
                      : AppColors.textlightmode,
                ),
                const SizedBox(height: 4),
                UiHelper.customText(
                  text: chat["msg"]!,
                  fontSize: 14,
                  context: context,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey[600],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              UiHelper.customText(
                text: chat["date"]!,
                fontSize: 12,
                context: context,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[400]
                    : Colors.grey[600],
              ),
              const SizedBox(height: 4),
              CircleAvatar(
                radius: 10,
                backgroundColor: Color(0XFFCED4DA),
                child: UiHelper.customText(
                    text: chat["msgcount"]!,
                    fontSize: 10,
                    context: context,
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
