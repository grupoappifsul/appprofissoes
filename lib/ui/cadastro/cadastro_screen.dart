// cadastro_page.dart
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String userType = 'Prestador';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1d4e89),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Cadastre-se!',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              _buildTextField('Nome'),
              const SizedBox(height: 20),
              _buildTextField('Email'),
              const SizedBox(height: 20),
              _buildTextField('Senha', isPassword: true),
              const SizedBox(height: 30),
              _userTypeSelector(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aqui você faria o cadastro!
                  },
                  style: _buttonStyle(),
                  child: const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _userTypeSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          const Text(
            'Tipo de Usuário:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1d4e89)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildUserTypeButton('Prestador'),
              const SizedBox(width: 10),
              _buildUserTypeButton('Contratante'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserTypeButton(String type) {
    bool isSelected = userType == type;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFFE0D7F8) : Colors.grey[200],
          foregroundColor: const Color(0xFF1d4e89),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {
          setState(() {
            userType = type;
          });
        },
        child: Text(
          type,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFE0D7F8),
      foregroundColor: const Color(0xFF1d4e89),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(vertical: 15),
    );
  }
}
