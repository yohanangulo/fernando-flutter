import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = 'cards-screen';

  @override
  Widget build(BuildContext context) {
    return const _CardsView();
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map(
              (e) => _CardStyle1(label: e['label'], elevation: e['elevation']),
            ),
            ...cards.map(
              (e) => _CardStyle2(label: e['label'], elevation: e['elevation']),
            ),
            ...cards.map(
              (e) => _CardStyle3(label: e['label'], elevation: e['elevation']),
            ),
            ...cards.map(
              (e) => _CardStyle4(label: e['label'], elevation: e['elevation']),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _CardStyle1 extends StatelessWidget {
  const _CardStyle1({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardStyle2 extends StatelessWidget {
  const _CardStyle2({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outline),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Outline'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardStyle3 extends StatelessWidget {
  const _CardStyle3({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: elevation,
      color: colors.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardStyle4 extends StatelessWidget {
  const _CardStyle4({
    required this.label,
    required this.elevation,
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/seed/$label/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
