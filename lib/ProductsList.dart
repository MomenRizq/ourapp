import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool loading = true;
  List<QueryDocumentSnapshot<Object?>> productsList = [];
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    CollectionReference products = FirebaseFirestore.instance.collection("Products");
    var data = await products.get();
    productsList = data.docs;
    loading = false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
