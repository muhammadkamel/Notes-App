import 'package:flutter/material.dart';
import 'package:notes_app/view/screens/notes/edit_note_screen.dart';

import '../screens/notes/add_user_screen.dart';
import '../screens/notes/notes_screen.dart';
import '../screens/notes/options_screen.dart';

class RoutePaths {
  static const notes = '/';
  static const editNote = 'editNote/';
  static const options = 'options/';
  static const addUser = 'addUser/';
}

class AppRoute {
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case RoutePaths.notes:
        return MaterialPageRoute(
          builder: (context) => const NotesScreen(),
        );
      case RoutePaths.editNote:
        final String noteText = route.arguments as String;
        return MaterialPageRoute(
          builder: (context) => EditNoteScreen(noteText: noteText),
        );
      case RoutePaths.options:
        return MaterialPageRoute(
          builder: (context) => const OptionsScreen(),
        );
      case RoutePaths.addUser:
        return MaterialPageRoute(
          builder: (context) => const AddUserScreen(),
        );
    }
    return null;
  }
}
