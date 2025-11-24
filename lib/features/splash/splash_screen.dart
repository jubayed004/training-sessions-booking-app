import 'package:flutter/material.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Profile"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.file_copy)),
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: Column(
          children: [

            CustomTextField(
              hintText: "Name",
              title: "Name",
            ),
          ],
        ),
      ),
    );
  }
}
