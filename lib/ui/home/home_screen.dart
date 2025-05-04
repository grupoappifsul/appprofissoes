import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'lista_profissionais_page.dart';
import 'suporte_page.dart'; // Certifique-se de que esse é o arquivo onde está ChatSuportePage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Controla o índice da barra de navegação

  // Função para abrir a tela de perfil
  void _openProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  void _openProfessionalsList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListaProfissionaisPage()),
    );
  }

  void _openSupport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatSuportePage()),
    );
  }

  // Função chamada ao mudar a aba na barra de navegação
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 1) { // Ícone de chat
      _openProfessionalsList(context);
    } else if (_selectedIndex == 2) { // Ícone de suporte
      _openSupport(context);
    }
    // Outros índices podem ser tratados aqui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.build, color: Colors.blue),
            const SizedBox(width: 8),
            const Text('NEED', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(icon: const Icon(Icons.search, color: Colors.blue), onPressed: () {}),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.blue,
            child: const Row(
              children: [
                Text('SELEÇÃO DE HOJE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.location_on, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text('PASSO FUNDO - 3KM', style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(6, (index) {
                  return GestureDetector(
                    onTap: () => _openProfile(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100 * ((index % 5) + 1)],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.cleaning_services, size: 40, color: Colors.white),
                            const SizedBox(height: 8),
                            Text(
                              'Profissional ${index + 1}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.handshake), label: ''),
        ],
      ),
    );
  }
}
