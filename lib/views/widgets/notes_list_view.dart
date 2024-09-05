import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_note_card.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 12,
          itemBuilder: (context, index) {
            return NoteCard(
              randomColor: cardColors[index % cardColors.length],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateNoteCard(
                            color: cardColors[index % cardColors.length],
                          )),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class UpdateNoteCard extends StatelessWidget {
  const UpdateNoteCard({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Scaffold(
          backgroundColor: color,
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                CustomAppBar(
                  title: 'Edit Note',
                  icon: CupertinoIcons.check_mark_circled_solid,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: 'Title',
                  colorFocusSide: Colors.white,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: 'description',
                  colorFocusSide: Colors.white,
                  maxLines: 3,
                ),
              ],
            ),
          )),
    );
  }
}
