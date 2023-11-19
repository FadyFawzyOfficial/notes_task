import 'package:flutter/material.dart';
import 'profile_view.dart';

import 'widgets/home_fab.dart';
import 'widgets/notes_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static const _widgetOptions = [
    NotesListView(),
    ProfileView(),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: _widgetOptions[_selectedIndex],
      floatingActionButton: _selectedIndex == 0 ? const HomeFab() : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);
}
