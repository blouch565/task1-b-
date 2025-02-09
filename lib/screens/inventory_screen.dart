import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "Bahtareen Store",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildSearchBar(),
              SizedBox(height: 10),
              _buildCard("Items Price Today", [
                {"icon": Icons.egg, "price": "22,000"},
                {"icon": Icons.food_bank, "price": "25,000"},
                {"icon": Icons.grain, "price": "1,800"},
                {"icon": Icons.pets, "price": "29,000"},
              ]),
              SizedBox(height: 10),
              _buildCard("Latest Products", [
                {"icon": Icons.eco, "price": "28,000"},
                {"icon": Icons.grain, "price": "4,200"},
                {"icon": Icons.local_florist, "price": "30,000"},
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBottomIcon(Icons.home, "Home", isSelected: _selectedIndex == 0),
            SizedBox(width: 30), // Space for FAB
            _buildBottomIcon(Icons.person, "Profile", isSelected: _selectedIndex == 2, isLast: true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search, color: Colors.orange),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<Map<String, dynamic>> items) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              children: items.map((item) {
                return ItemCard(icon: item["icon"], price: item["price"]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, String label, {bool isSelected = false, bool isLast = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(isSelected ? 0 : 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: isSelected ? Colors.orange : Colors.grey),
            SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 10, color: isSelected ? Colors.orange : Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final IconData icon;
  final String price;

  const ItemCard({required this.icon, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.orange),
        SizedBox(height: 8),
        Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
