import 'package:emol/screens/LanguagePage.dart';
import 'package:emol/screens/SecurityPage.dart';
import 'package:emol/screens/SupportPage.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // Variables de paramètres
  bool _isNotificationsEnabled = true;
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: [
            // Titre de section : Notifications
            _buildSectionTitle("Notifications"),
            // Paramètre des notifications
            _buildSwitchTile(
              title: "Notifications",
              subtitle: "Recevoir des notifications",
              value: _isNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationsEnabled = value;
                });
              },
            ),
            const Divider(),

            // Titre de section : Thème
            _buildSectionTitle("Thème"),
            // Paramètre du thème sombre
            _buildSwitchTile(
              title: "Mode sombre",
              subtitle: "Passer en mode sombre",
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;
                });
              },
            ),
            const Divider(),

            // Titre de section : Autres options
            _buildSectionTitle("Autres options"),
            // Paramètre de langue
            _buildSettingTile(
              title: "Langue",
              subtitle: "Modifier la langue de l'application",
              icon: Icons.language,
              onTap: () {
                Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LanguagePage(), 
      ),
    );
              },
            ),
            const Divider(),

            // Paramètre de sécurité
            _buildSettingTile(
              title: "Sécurité",
              subtitle: "Modifier votre mot de passe",
              icon: Icons.lock,
              onTap: () {
                 Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecurityPage(), 
      ),
    );
              },
            ),
            const Divider(),

            // Paramètre de support
            _buildSettingTile(
              title: "Support",
              subtitle: "Contacter le support",
              icon: Icons.help_outline,
              onTap: () {
                Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SupportPage(), 
      ),
    );
              },
            ),
            const Divider(),

            // Bouton de déconnexion
            _buildActionButton(
              icon: Icons.exit_to_app,
              label: "Se déconnecter",
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context); // Retourne à la page précédente ou à la page d'accueil
              },
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour créer une section avec un titre
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Méthode pour un élément avec un interrupteur
  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.orange,
      ),
    );
  }

  // Méthode pour un élément de paramètre normal avec icône
  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  // Méthode pour créer un bouton d'action avec icône
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
