import 'package:flutter/material.dart';

class SuperHomeCard extends StatelessWidget {
  const SuperHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        shrinkWrap: true,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: [
          Container(
            color: Colors.red,
            child: const Center(child: Text("Card 1")),
          ),
          Container(
            color: Colors.green,
            child: const Center(child: Text("Card 2")),
          ),
          Container(
            color: Colors.blue,
            child: const Center(child: Text("Card 3")),
          ),
        ],
      ),
    );
  }
}
