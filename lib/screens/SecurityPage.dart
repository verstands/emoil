import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sécurité"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 4.0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
           
            const Text(
              "Modifiez votre mot de passe ou configurez vos options de sécurité.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            _buildSecurityOption("Changer le mot de passe", Icons.lock, Colors.blue, _showChangePasswordDialog),
            _buildSecurityOption("Activer la vérification en deux étapes", Icons.security, Colors.green, _showTwoStepVerificationDialog),
            _buildSecurityOption("Historique des connexions", Icons.history, Colors.orange, _showHistoryDialog),
          ],
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Changer le mot de passe'),
          content: const Text('Voulez-vous vraiment changer votre mot de passe ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }

  void _showTwoStepVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Vérification en deux étapes'),
          content: const Text('Souhaitez-vous activer la vérification en deux étapes pour une sécurité accrue ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              
              },
              child: const Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }


  void _showHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Historique des connexions'),
          content: const Text('Souhaitez-vous consulter l\'historique de vos connexions ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                
              },
              child: const Text('Consulter'),
            ),
          ],
        );
      },
    );
  }


  Widget _buildSecurityOption(
      String title, IconData icon, Color iconColor, Function(BuildContext) onTapAction) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          color: iconColor, 
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
        onTap: () => onTapAction(context), 
      ),
    );
  }
}
