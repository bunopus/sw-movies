import 'package:flutter/material.dart';

class CharactersScroller extends StatelessWidget {
  CharactersScroller(this.characters);

  final List<String> characters;

  Widget _buildCharacter(BuildContext ctx, int index) {
    var character = characters[index];

    return new Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: new Column(
        children: [
          new Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: new Text(character),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: new Text(
            'Characters',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: new ListView.builder(
            itemCount: characters.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _buildCharacter,
          ),
        ),
      ],
    );
  }
}
