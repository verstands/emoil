import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 4.0, // Ombre pour un effet moderne
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Titre principal
            const Text(
              "Accédez à l'assistance et à l'aide de l'application.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            // Liste des options de support avec un design amélioré
            _buildSupportOption("Contacter le support", Icons.phone, Colors.blue, context),
            _buildSupportOption("FAQ", Icons.help, Colors.green, context),
            _buildSupportOption("Signaler un problème", Icons.report, Colors.red, context),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(String title, IconData icon, Color iconColor, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Position de l'ombre
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor, // Couleur de l'icône
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.orange.shade700,
        ),
        onTap: () {
          _handleSupportOption(title, context);
        },
      ),
    );
  }

  // Fonction qui gère l'option sélectionnée
  void _handleSupportOption(String title, BuildContext context) {
    if (title == "Contacter le support") {
      _showContactSupportDialog(context);
    } else if (title == "FAQ") {
      _showFAQDialog(context);
    } else if (title == "Signaler un problème") {
      _showReportProblemDialog(context);
    }
  }

  // Dialog pour contacter le support
  void _showContactSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contacter le support'),
          content: const Text('Voulez-vous parler à un agent du support ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Ajoutez ici la logique pour contacter le support
              },
              child: const Text('Contacter'),
            ),
          ],
        );
      },
    );
  }

  // Dialog pour afficher la FAQ
  void _showFAQDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('FAQ'),
          content: const Text('Vous pouvez consulter la FAQ pour obtenir de l\'aide.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Dialog pour signaler un problème
  void _showReportProblemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signaler un problème'),
          content: const Text('Souhaitez-vous signaler un problème dans l\'application ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Ajoutez ici la logique pour signaler un problème
              },
              child: const Text('Signaler'),
            ),
          ],
        );
      },
    );
  }
}
