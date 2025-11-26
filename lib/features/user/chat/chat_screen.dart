import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: isDarkMode ? Colors.white : Color(0xFFE94E6C), letterSpacing: -0.5),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Chat Screen")
          ],
        ),
      )),
    );
  }
}
