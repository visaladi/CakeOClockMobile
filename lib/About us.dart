import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About Us Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Branch Locations:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            // Use GridView to display branches in a grid layout
            GridView.builder(
              shrinkWrap: true,
              itemCount: 3, // Number of branches
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Display branches in 2 columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                // Hardcoded branch data for demonstration
                List<Map<String, String>> branches = [
                  {'name': 'Branch 1', 'address': 'Address 1', 'phone': 'XXX-XXX-XXXX'},
                  {'name': 'Branch 2', 'address': 'Address 2', 'phone': 'XXX-XXX-XXXX'},
                  {'name': 'Branch 3', 'address': 'Address 3', 'phone': 'XXX-XXX-XXXX'},
                ];
                return _buildBranchTile(branches[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBranchTile(Map<String, String> branch) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              branch['name']!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Address: ${branch['address']}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Phone: ${branch['phone']}',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
