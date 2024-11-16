import 'package:emol/screens/ServiceInteractionPage.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  final String serviceName;
  final String serviceDescription;

  const ServicePage({
    super.key,
    required this.serviceName,
    required this.serviceDescription,
  });

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.serviceName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image du service
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey[300],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/service_placeholder.png'), // Remplacez par votre image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Titre du service
              Text(
                widget.serviceName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 8.0),

              // Description du service
              Text(
                widget.serviceDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16.0),

              // Informations supplémentaires
              const Text(
                "Informations supplémentaires :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris. Fusce non libero ornare, bibendum velit non, hendrerit libero.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24.0),

              // Bouton d'action
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Confirmation"),
                          content: const Text(
                              "Voulez-vous vraiment interagir avec ce service ?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Ferme la boîte de dialogue
                              },
                              child: const Text("Annuler"),
                            ),
                            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceInteractionPage(
            serviceName: widget.serviceName),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Ajout de l'espace horizontal
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  child: const Text("Confirmer"),
),

                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Interagir avec ce service",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
