import 'package:flutter/material.dart';
import '../chat/chat_screen.dart';
import '../core/widgets/app_colors.dart';

class ListaProfissionaisPage extends StatelessWidget {
  const ListaProfissionaisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header com logo e filtro
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.build, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'NEED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.filter_list, color: Colors.white),
                ],
              ),
            ),
            // Campo de busca
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  filled: true,
                  fillColor: AppColors.lightBackgroundColor,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Lista de profissionais
            Expanded(
              child: ListView(
                children: const [
                  ProfissionalItem(nome: 'Bia', profissao: 'Diarista'),
                  ProfissionalItem(nome: 'Gustavo', profissao: 'Pedreiro'),
                  ProfissionalItem(nome: 'Pedro Henrique', profissao: 'Encanador'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Pode criar AppColors.darkBackground se quiser
        selectedItemColor: AppColors.lightBackgroundColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.handshake), label: ''),
        ],
      ),
    );
  }
}

// Widget individual do profissional
class ProfissionalItem extends StatelessWidget {
  final String nome;
  final String profissao;

  const ProfissionalItem({
    super.key,
    required this.nome,
    required this.profissao,
  });

  void _navigateToChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatProfissionalPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(nome),
        subtitle: Text(profissao),
        trailing: IconButton(
          icon: const Icon(Icons.chat),
          onPressed: () {
            _navigateToChat(context);
          },
        ),
      ),
    );
  }
}
