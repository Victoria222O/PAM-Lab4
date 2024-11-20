import 'package:flutter/material.dart';
import 'package:laborator4/presentation/wine_card.dart';
import '../domain/wine.dart';
import '../data/wine_repository_impl.dart';

class WineShopScreen extends StatefulWidget {
  @override
  _WineShopScreenState createState() => _WineShopScreenState();
}

class _WineShopScreenState extends State<WineShopScreen> {
  late Future<List<Wine>> wineData;

  @override
  void initState() {
    super.initState();
    wineData = WineRepositoryImpl().fetchWines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Donnerville Drive',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              '4 Donnerville Hall, Donnerville Drive, Adamaston...',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.notifications, color: Colors.black),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '123',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              // Acțiune pentru notificări
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Wine>>(
        future: wineData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Eroare la încărcarea datelor"));
          } else {
            final wines = snapshot.data!;
            return ListView.builder(
              itemCount: wines.length,
              itemBuilder: (context, index) {
                final wine = wines[index];
                return WineCard(wine: wine);
              },
            );
          }
        },
      ),
    );
  }
}
