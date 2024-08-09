import 'package:dog_api/models/dog.dart';
import 'package:flutter/material.dart';

class DogDetails extends StatefulWidget {
  final Dog dog;
  const DogDetails({super.key, required this.dog});

  @override
  State<DogDetails> createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.5,
                ),
                Text(
                  widget.dog.breeds.first.name,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Thông tin chú chó: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0, 3))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Life Span: ${widget.dog.breeds.first.lifeSpan}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Temperament: ${widget.dog.breeds.first.temperament}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Height: ${widget.dog.breeds.first.height.metric} (Metric)",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Weight: ${widget.dog.breeds.first.height.metric} (Metric)",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Bred For: ${widget.dog.breeds.first.bredFor}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Breed Group: ${widget.dog.breeds.first.breedGroup}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: h * 0.5,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(widget.dog.url), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ),
          Positioned(
              top: 15,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
