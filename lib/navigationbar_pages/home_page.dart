import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourapp/widget/custom_text.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final List<String> names = <String>[
    "Men",
    "Women",
    "Children",
    "Accessories",
    "Offers"
  ];

  final List<String> images = <String>[
    "assets/man.jpeg",
    "assets/Women.jpeg",
    "assets/both.jpeg",
    "assets/exci.jpeg",
    "assets/person.jpeg"
  ];

  bool loading = true;
  List<QueryDocumentSnapshot<Object?>> productsList = [];
  List<QueryDocumentSnapshot<Object?>> categoriesList = [];

  @override
  void initState() {
    super.initState();
    getProducts();
    getCategories();
  }

  getProducts() async {
    CollectionReference products = FirebaseFirestore.instance.collection("Products");
    var data = await products.get();
    productsList = data.docs;
    loading = false;
    setState(() {});
  }

  getCategories() async {
    CollectionReference categories = FirebaseFirestore.instance.collection("Categories");
    var data1 = await categories.get();
    categoriesList = data1.docs;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _SearchField(),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Categories",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , color: Colors.purple),
                    )),
                const SizedBox(
                  height: 25,
                ),
                _ListViewCategories(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Trending",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , color: Colors.purple),
                        )),
                    CustomText(
                      maxLine: 1,
                      text: "See more",
                      fontSize: 15,
                      color: Colors.purple,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 500,
                  child: GridCycle(),
                ),
              ],
            ),
          ),
        );
  }

  Widget _SearchField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  Widget _ListViewCategories() {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount:  categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade100),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network('${categoriesList[index]["icon"]}'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                maxLine: 1,
                text: categoriesList[index]["name"],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
      ),
    );
  }

  Widget GridCycle() {
    return GridView.builder(
      itemCount: productsList.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // ignore: missing_return
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardView(index),
        );
      },
    );
  }

  Widget CardView(int index){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Card(
        child: Hero(
            tag: productsList[index]["name"],
            child: Material(
              child: InkWell(
                onTap: () {},
                child: GridTile(
                  child: Image.network(
                    '${productsList[index]["image"]}',
                    fit: BoxFit.cover,
                  ),
                  footer: Container(
                    color: Colors.white70,
                    height: 60,
                    child:  ListTile(
                      leading: Text(
                        productsList[index]["name"],
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      title: Text(
                        "\$${productsList[index]["price"]}",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
