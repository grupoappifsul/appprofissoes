import 'package:flutter/material.dart';

class ChatSuportePage extends StatelessWidget {
  const ChatSuportePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Suporte'),
        backgroundColor: const Color(0xFF2E3A59),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Card(
                color: Color(0xFFEDEDED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Olá! No que posso ajudar?'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Digite sua mensagem...',
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
