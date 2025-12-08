import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/features/user/chat/controller/chat_controller.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = Get.put(ChatController(), permanent: false);
  @override
  void dispose() {
    super.dispose();
    Get.delete<ChatController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        scrolledUnderElevation: 0,

        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=5',
              ), // Placeholder image
              radius: 20,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ann Smith",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackMainTextColor,
                  ),
                ),
                Text(
                  "Online",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: AppColors.blackMainTextColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  if (message.isSystem) {
                    return _buildSystemMessage(context, message);
                  }
                  return _buildMessageBubble(context, message);
                },
              );
            }),
          ),
          _buildMessageInput(context, controller),
        ],
      ),
    );
  }

  Widget _buildSystemMessage(BuildContext context, ChatMessage message) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message.text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.grayTextSecondaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(BuildContext context, ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: message.isSender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              color: message.isSender
                  ? AppColors.primaryColor
                  : AppColors.bgSecondaryButtonColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(message.isSender ? 16 : 0),
                bottomRight: Radius.circular(message.isSender ? 0 : 16),
              ),
            ),
            child: Text(
              message.text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: message.isSender
                    ? AppColors.white
                    : AppColors.blackMainTextColor,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            message.time,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.grayTextSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context, ChatController controller) {
    final textController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.backgroundsLinesColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Enter message...",
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grayTextSecondaryColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.primaryColor),
            onPressed: () {
              controller.sendMessage(textController.text);
              textController.clear();
            },
          ),
        ],
      ),
    );
  }
}
