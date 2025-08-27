import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas14fluttter/model/user_model.dart';

class DetailScreen extends StatelessWidget {
  final Result result;
  const DetailScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result.name),
        backgroundColor: (Color.fromARGB(255, 82, 148, 121)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 82, 148, 121),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (result.image.isNotEmpty)
                  Center(child: Image.network(result.image, height: 200)),
                const SizedBox(height: 20),

                Text(
                  "Name: ${result.name}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "Status: ${result.status}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                Text(
                  "Species: ${result.species}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                Text(
                  "Type: ${result.type.isNotEmpty ? result.type : 'N/A'}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                Text(
                  "Gender: ${result.gender}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                Text(
                  "Origin: ${result.origin.name}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                Text(
                  "Location: ${result.location.name}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                Text(
                  "Episodes: ${result.episode.length}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                // Text(
                //   "URL: ${result.url}",
                //   style: const TextStyle(fontSize: 16),
                // ),
                // const SizedBox(height: 10),
                Text(
                  "Created: ${result.created}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
