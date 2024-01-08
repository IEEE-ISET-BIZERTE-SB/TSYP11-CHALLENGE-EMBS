import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png', // Replace with the path to your logo image
              height: 40,
            ),
            SizedBox(width: 8),
            Text('PULSEPAL'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Our Medical App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Your Health, Our Priority',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 32),
            SizedBox(
              height: 200, // Adjust the height of the carousel
              child: PageView(
                children: [
                  Image.asset('assets/images/image1.jfif', fit: BoxFit.cover),
                  Image.asset('assets/images/image2.jfif', fit: BoxFit.cover),
                  Image.asset('assets/images/image3.jfif', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Our Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ServiceCard(
                      title: 'Monitor Health',
                      icon: Icons.favorite,
                      onTap: () {
                        // Handle 'Monitor Health' tap
                      },
                    ),
                    ServiceCard(
                      title: 'Manage Medication',
                      icon: Icons.local_hospital,
                      onTap: () {
                        // Handle 'Manage Medication' tap
                      },
                    ),
                    // Add more ServiceCard widgets for additional services
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ServiceCard({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
