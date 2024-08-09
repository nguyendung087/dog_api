import 'package:dog_api/models/dog.dart';
import 'package:dog_api/pages/dog_details.dart';
import 'package:dog_api/services/api_handler.dart';
import 'package:flutter/material.dart';

class DogList extends StatelessWidget {
  const DogList({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chào mừng đến Dog Store",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: w * .06,
              letterSpacing: 2,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Dog>>(
          future: APIHandler.getDogs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text("Không có dữ liệu"),
              );
            }
            final snap = snapshot.data!;
            return ListView.builder(
                itemCount: snap.length,
                itemBuilder: (context, index) {
                  final dog = snap[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DogDetails(dog: dog)));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(dog.url),
                                          fit: BoxFit.cover)),
                                  height: 80,
                                  width: 80,
                                ),
                              ]),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dog.breeds.first.name,
                                  style: TextStyle(
                                      fontSize: w * .035,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dog.breeds.first.temperament,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      backgroundColor: Colors.blue[100],
    );
  }
}
