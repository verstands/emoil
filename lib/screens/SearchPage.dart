import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, String>> services = [
    {'name': 'Consultation juridique', 'description': 'Obtenez des conseils juridiques pour diverses situations.'},
    {'name': 'Réparation automobile', 'description': 'Service de réparation pour votre voiture, toutes marques.'},
    {'name': 'Assistance informatique', 'description': 'Aide technique pour résoudre vos problèmes informatiques.'},
    {'name': 'Cours de cuisine', 'description': 'Apprenez à cuisiner avec des professionnels.'},
    {'name': 'Livraison à domicile', 'description': 'Livraison rapide de vos courses directement chez vous.'},
    {'name': 'Rénovation de maison', 'description': 'Transformez votre espace avec des services de rénovation.'},
    {'name': 'Coaching personnel', 'description': 'Accompagnement personnalisé pour atteindre vos objectifs.'},
    {'name': 'Photographie professionnelle', 'description': 'Capturer vos moments spéciaux avec des photos de qualité.'},
    {'name': 'Séances de sport', 'description': 'Programmes d’entraînement adaptés à vos besoins.'},
    {'name': 'Services de ménage', 'description': 'Nettoyage professionnel pour votre maison ou bureau.'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filtrer les services en fonction de la recherche
    final filteredServices = services.where((service) {
      return service['name']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
             service['description']!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Recherche de services"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Champ de recherche amélioré
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                hintText: 'Rechercher un service...',
                prefixIcon: Icon(Icons.search, color: Colors.orange),
                filled: true,
                fillColor: Colors.orange.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.orange.shade200, width: 2),
                ),
              ),
            ),
          ),
          // Affichage des services filtrés
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                final service = filteredServices[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.business, color: Colors.orange),
                    title: Text(service['name']!),
                    subtitle: Text(service['description']!),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
