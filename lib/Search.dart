import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(
          'Bookshelf',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle shopping cart icon press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF5F1E4),
                  contentPadding: EdgeInsets.all(10.0),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search for books, authors, genres',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(33.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 12.0, // Increased vertical spacing between buttons
                children: [
                  TopicButton(topic: 'Fiction'),
                  TopicButton(topic: 'Non-Fiction'),
                  TopicButton(topic: 'Science Fiction'),
                  TopicButton(topic: 'Mystery'),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Top Searches',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TopSearches(),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recent Searches',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: RecentSearches(),
            ),
          ],
        ),
      ),
    );
  }
}

class TopicButton extends StatelessWidget {
  final String topic;

  const TopicButton({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the search page with the selected topic
        // You can use Navigator to push a new screen for searching
        // or any other navigation method you prefer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchResultsScreen(topic: topic)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Increased padding
        decoration: BoxDecoration(
          color: Color(0xFFF5F1E4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          topic,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class SearchResultsScreen extends StatelessWidget {
  final String topic;

  const SearchResultsScreen({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results for $topic'),
      ),
      body: Center(
        child: Text('Search results will appear here for $topic'),
      ),
    );
  }
}

class TopSearches extends StatelessWidget {
  final List<String> books = [
    "1984 by George Orwell",
    "Meditations by Marcus Aurelius",
    "Becoming by Michelle Obama",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: books
          .map((book) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchResultsScreen(topic: book.split(" ")[0])),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8.0), // Added margin bottom
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Increased padding
          decoration: BoxDecoration(
            color: Color(0xFFF5F1E4),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search, color: Colors.black),
              SizedBox(width: 5.0),
              Text(
                book,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ))
          .toList(),
    );
  }
}

class RecentSearches extends StatelessWidget {
  final List<String> recentBooks = [
    "The Alchemist by Paulo Poelho",
    "To kill a mocking bird by Harper Lee",
    "Grooking Algorithms by Aditya Y. Bhargava",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: recentBooks
          .map((book) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchResultsScreen(topic: book.split(" ")[0])),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8.0), // Added margin bottom
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Increased padding
          decoration: BoxDecoration(
            color: Color(0xFFF5F1E4),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search, color: Colors.black),
              SizedBox(width: 5.0),
              Text(
                book,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ))
          .toList(),
    );
  }
}
