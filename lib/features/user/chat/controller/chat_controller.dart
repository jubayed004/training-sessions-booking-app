import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isSender;
  final String time;
  final bool isSystem;

  ChatMessage({
    required this.text,
    required this.isSender,
    required this.time,
    this.isSystem = false,
  });
}

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    messages.addAll([
      ChatMessage(
        text:
            "Hey! I just wanted to confirm our meeting for tomorrow at 10am. Does that suit you?",
        isSender: true,
        time: "04:45 PM",
      ),
      ChatMessage(
        text:
            "Yes, all clear! I've been working on the stretches you showed me.",
        isSender: false,
        time: "04:45 PM",
      ),
      ChatMessage(
        text: "Session booked for tomorrow at 10am",
        isSender: false,
        time: "",
        isSystem: true,
      ),
      ChatMessage(
        text: "I'm glad to hear that! See you tomorrow at the meeting!",
        isSender: true,
        time: "04:45 PM",
      ),
    ]);
  }

  void sendMessage(String text) {
    if (text.isEmpty) return;
    messages.add(ChatMessage(text: text, isSender: true, time: "Now"));
  }
}
