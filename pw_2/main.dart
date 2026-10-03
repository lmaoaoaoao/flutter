import 'package:flutter/material.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Заметки',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const NotesScreen(),
    );
  }
}

class Note {
  String text;
  Note({required this.text});
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Note> _notes = [];

  int? _editingIndex;

  void _saveNote() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      if (_editingIndex == null) {
        _notes.add(Note(text: text));
      } else {
        _notes[_editingIndex!].text = text;
        _editingIndex = null;
      }
      _controller.clear();
    });
  }

  void _editNote(int index) {
    setState(() {
      _editingIndex = index;
      _controller.text = _notes[index].text;
    });
  }

  void _deleteNote(int index) {
    setState(() {
      if (_editingIndex == index) {
        _editingIndex = null;
        _controller.clear();
      }
      _notes.removeAt(index);
    });
  }

  void _cancelEdit() {
    setState(() {
      _editingIndex = null;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заметки'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: _editingIndex == null ? 'Новая заметка' : 'Редактирование заметки',
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
              minLines: 1,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _saveNote,
                  child: Text(_editingIndex == null ? 'Сохранить' : 'Сохранить изменения'),
                ),
                if (_editingIndex != null) ...[
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: _cancelEdit,
                    child: const Text('Отмена'),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Список заметок',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _notes.isEmpty
                  ? const Center(child: Text('Заметок пока нет'))
                  : ListView.builder(
                      itemCount: _notes.length,
                      itemBuilder: (context, index) {
                        final note = _notes[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(note.text),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => _editNote(index),
                                  tooltip: 'Редактировать',
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => _deleteNote(index),
                                  tooltip: 'Удалить',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
