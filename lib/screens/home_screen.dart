import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    Container(
      color: Colors.red,
    ),
    Container(color: Colors.green),
  ];
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
            ),
            label: 'Chats',
          ),
        ],
        onTap: (_index) {
          setState(() {
            _currentPage = _index;
          });
        },
      ),
    );
  }
}
