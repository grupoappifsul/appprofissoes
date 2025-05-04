import 'package:flutter/material.dart';
import 'chat_profissional_page.dart';

class ListaProfissionaisPage extends StatelessWidget {
  const ListaProfissionaisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF204E85),
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
                  fillColor: Colors.white,
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
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
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

  // Função para navegar até a tela de chat
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
            // Navegar para a tela de chat
            _navigateToChat(context);  // Chama a navegação para o chat
          },
        ),
      ),
    );
  }
}
