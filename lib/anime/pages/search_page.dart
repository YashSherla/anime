import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 236, 247, 236),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      labelText: 'Search',
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 60),
                    backgroundColor: const Color.fromARGB(255, 236, 247, 236),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.green,
                    size: 25,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
