import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  // Langue sélectionnée par défaut
  String _selectedLanguage = "Français";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Langue"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 4.0, // légère ombre pour un effet moderne
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sélectionner la langue de l'application",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Liste des langues avec un design amélioré
            _buildLanguageOption("Français", Icons.language, context),
            _buildLanguageOption("English", Icons.language, context),
            _buildLanguageOption("Español", Icons.language, context),
            _buildLanguageOption("Deutsch", Icons.language, context),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language, IconData icon, BuildContext context) {
    bool isSelected = _selectedLanguage == language;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.shade50 : Colors.white, // Couleur différente pour la sélection
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.orange,
        ),
        title: Text(
          language,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.orange : Colors.black, 
          ),
        ),
        trailing: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.orange,
              )
            : const Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange,
              ),
        onTap: () {
          setState(() {
            _selectedLanguage = language;
          });
        },
      ),
    );
  }
}
