import 'package:flutter/material.dart';

class ToggleScreen extends StatefulWidget {
  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  int _selectedOption1Index = 0; // Initial selection index for first set of toggle buttons
  int _selectedOption2Index = 0; // Initial selection index for second set of toggle buttons
  TextEditingController _priceController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove app bar elevation
        backgroundColor: Colors.transparent, // Make app bar transparent
      ),
      extendBodyBehindAppBar: true, // Extend body behind app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 20), // Add some space between the back button and the rest of the content
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Rounded border
                  border: Border.all(), // Add a border for visual clarity
                ),
                child: ToggleButtons(
                  children: [
                    Text('Novels'),
                    Text('Books'),
                  ],
                  isSelected: [_selectedOption1Index == 0, _selectedOption1Index == 1],
                  onPressed: (int index) {
                    setState(() {
                      _selectedOption1Index = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Rounded border
                  border: Border.all(), // Add a border for visual clarity
                ),
                child: ToggleButtons(
                  children: [
                    Text('Used'),
                    Text('New'),
                  ],
                  isSelected: [_selectedOption2Index == 0, _selectedOption2Index == 1],
                  onPressed: (int index) {
                    setState(() {
                      _selectedOption2Index = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Price',
                filled: true, // Fill the text box
                fillColor: Color(0xFFF5F1E4), // Set fill color to #f5f1e4
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Rounded border
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)), // Set opacity to 50%
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Describe Your Location',
                filled: true, // Fill the text box
                fillColor: Color(0xFFF5F1E4), // Set fill color to #f5f1e4
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), // Rounded border
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)), // Set opacity to 50%
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF5F1E4), // Set background color to #f5f1e4
        selectedItemColor: Colors.black, // Set color of selected item
        unselectedItemColor: Colors.black.withOpacity(0.5), // Set color of unselected item
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), // Use an appropriate icon here
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Ads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
