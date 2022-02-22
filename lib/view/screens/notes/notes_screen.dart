import 'package:flutter/material.dart';
import 'package:notes_app/view/shared/constains.dart';
import 'package:notes_app/view/shared/route_paths.dart';
import 'package:notes_app/view_model/notes_view_model.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.addUser);
            },
            icon: const Icon(
              Icons.person_add,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.options);
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              NotesViewModel.clearAllNotes();
            },
            icon: const Icon(
              Icons.clear_all,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 5),
            _FilterAndSearch(),
            _NotesList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _FilterAndSearch extends StatefulWidget {
  const _FilterAndSearch({Key? key}) : super(key: key);

  @override
  State<_FilterAndSearch> createState() => _FilterAndSearchState();
}

class _FilterAndSearchState extends State<_FilterAndSearch> {
  bool openSearch = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_list,
            color: Colors.purple,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              openSearch = !openSearch;
            });
          },
          icon: const Icon(
            Icons.search,
            color: Colors.purple,
          ),
        ),

        // Search input
        if (openSearch)
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                decoration: inputDecoration.copyWith(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 7),
                ),
              ),
            ),
          ),
        const SizedBox(width: 7),
      ],
    );
  }
}

class _NotesList extends StatelessWidget {
  const _NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<dynamic>>(
          future: NotesViewModel.getAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final data = snapshot.data;
              return ListView.separated(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.only(bottom: 75),
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1.5,
                  );
                },
                itemBuilder: (context, index) {
                  final String text = data![index]['text'];
                  return ListTile(
                    subtitle: Text(
                      text,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        height: 1.7,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutePaths.editNote,
                            arguments: text);
                      },
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
