import 'package:bloc_example/news_bloc/news_bloc.dart';
import 'package:bloc_example/notes_bloc/notes_bloc.dart';
import 'package:bloc_example/screens/news_screen.dart';
import 'package:bloc_example/screens/notes_screen.dart';
import 'package:bloc_example/screens/settings_screen.dart';
import 'package:bloc_example/settings_bloc/settings_bloc.dart';
import 'package:bloc_example/settings_bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter/counter_bloc.dart';
import 'screens/counter_screen.dart';
import 'models/counter_model.dart';
import 'blocs/counter/counter_event.dart';
import 'blocs/counter/counter_state.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       title: "bloc demo",
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (context) => CounterBloc()..add(CounterStarted()),
//         child: const CounterScreen(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/notes_bloc/notes_bloc.dart';
import '/news_bloc/news_bloc.dart';
import '/settings_bloc/settings_bloc.dart';
import 'screens/notes_screen.dart';
import 'screens/news_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotesBloc()),
        BlocProvider(create: (_) => NewsBloc()),
        BlocProvider(create: (_) => SettingsBloc()),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NotesScreen(),
    NewsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter State Management")),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
