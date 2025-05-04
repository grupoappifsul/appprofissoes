import 'package:flutter/material.dart';

class ChatProfissionalPage extends StatelessWidget {
  const ChatProfissionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3A59),
        automaticallyImplyLeading: true,
        title: const Row(
          children: [
            Icon(Icons.build, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'NEED',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'Bia (Diarista)',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Mensagens
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatBubble(
                  text: 'Oi, tudo bem? Como posso ajudar?',
                  isUser: true,
                  borderColor: Colors.purple,
                ),
                SizedBox(height: 12),
                ChatBubble(text: 'Olá! Gostaria de saber mais sobre os seus serviços.', isUser: false),
                SizedBox(height: 12),
                ChatBubble(text: '...', isUser: true),
              ],
            ),
          ),
          // Campo de digitação
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final Color? borderColor;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isUser,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFE5E5),
          borderRadius: BorderRadius.circular(20),
          border:
          borderColor != null
              ? Border.all(color: borderColor!, width: 2)
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
