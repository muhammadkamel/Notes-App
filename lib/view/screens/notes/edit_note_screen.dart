import 'package:flutter/material.dart';
import 'package:notes_app/view_model/notes_view_model.dart';
import 'package:notes_app/view_model/user_view_model.dart';

import '../../shared/constains.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    Key? key,
    required this.noteText,
  }) : super(key: key);

  final String noteText;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _noteTextController;

  @override
  void initState() {
    super.initState();
    _noteTextController = TextEditingController(text: widget.noteText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
        actions: [
          IconButton(
            onPressed: () {
              NotesViewModel.updateNote(_noteTextController.text, "1")
                  .then((value) {
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _noteTextController,
                  maxLines: 10,
                  decoration: inputDecoration.copyWith(
                    label: const Text("Note"),
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder<List<dynamic>>(
                    future: UsersViewModel.getAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return DropdownButtonFormField<String>(
                          decoration: inputDecoration.copyWith(
                            alignLabelWithHint: true,
                            label: const Text("Assign To User"),
                          ),
                          items: List.generate(snapshot.data!.length, (index) {
                            return DropdownMenuItem<String>(
                              child: Text(snapshot.data![index]['username']),
                              value: snapshot.data![index]['id'],
                            );
                          }),
                          onChanged: (value) {},
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
