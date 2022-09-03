import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<QueryDocumentSnapshot<Object?>> categoriesList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  getCategories() async {
    CollectionReference categories =
        FirebaseFirestore.instance.collection("Categories");
    var data1 = await categories.get();
    categoriesList = data1.docs;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: ScrollController(),
      itemCount: categoriesList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    categoriesList[index]["image"],
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    categoriesList[index]["name"],
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
