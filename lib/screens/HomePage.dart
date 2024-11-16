import 'package:emol/screens/CategoryPage.dart';
import 'package:emol/screens/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:emol/screens/LocationPage.dart';
import 'package:emol/screens/ServicePga.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Liste de services avec des données plus spécifiques
  final List<Map<String, String>> services = [
    {
      'name': 'Consultation juridique',
      'description':
          'Obtenez des conseils juridiques pour diverses situations.',
    },
    {
      'name': 'Réparation automobile',
      'description':
          'Service de réparation pour votre voiture, toutes marques.',
    },
    {
      'name': 'Assistance informatique',
      'description':
          'Aide technique pour résoudre vos problèmes informatiques.',
    },
    {
      'name': 'Cours de cuisine',
      'description': 'Apprenez à cuisiner avec des professionnels.',
    },
    {
      'name': 'Livraison à domicile',
      'description': 'Livraison rapide de vos courses directement chez vous.',
    },
    {
      'name': 'Rénovation de maison',
      'description':
          'Transformez votre espace avec des services de rénovation.',
    },
    {
      'name': 'Coaching personnel',
      'description':
          'Accompagnement personnalisé pour atteindre vos objectifs.',
    },
    {
      'name': 'Photographie professionnelle',
      'description':
          'Capturer vos moments spéciaux avec des photos de qualité.',
    },
    {
      'name': 'Séances de sport',
      'description': 'Programmes d’entraînement adaptés à vos besoins.',
    },
    {
      'name': 'Services de ménage',
      'description': 'Nettoyage professionnel pour votre maison ou bureau.',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filtrage des services en fonction de la recherche
    final filteredServices = services.where((service) {
      return service['name']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          service['description']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Accueil"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filtres
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoryPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.category),
                  label: const Text("Catégories"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text("Localisations"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
              ],
            ),
          ),
          // Liste des Services
          Expanded(
            child: ListView.builder(
              itemCount:
                  filteredServices.length, // Utilisation des services filtrés
              itemBuilder: (context, index) {
                final service = filteredServices[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    leading: const Icon(Icons.business, color: Colors.orange),
                    title: Text(service['name']!),
                    subtitle: Text(service['description']!),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServicePage(
                            serviceName: service['name']!,
                            serviceDescription: service['description']!,
                          ),
                        ),
                      );
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

  // Afficher un champ de recherche
  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Recherche"),
          content: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: const InputDecoration(
              hintText: "Entrez un service ou une catégorie",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Filtre basé sur la recherche
                  searchQuery = searchQuery.trim();
                });
                Navigator.pop(context);
              },
              child: const Text("Rechercher"),
            ),
          ],
        );
      },
    );
  }
}
