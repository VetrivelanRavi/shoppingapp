// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:demoapp_15_04/View/view3.dart';
import 'package:demoapp_15_04/ViewModel/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int myIndex = 0;

  var Prod = ViewModel().RemoveItems;

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (context, ProdData, child) => SizedBox(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 0,
          ),
          body: ListView.builder(
            itemCount: ProdData.ProdDataAdd.length,
            itemBuilder: (context, index) {
              final ModelData = ProdData.ProdDataAdd[index];
              return Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.black,
                    toolbarTextStyle: TextStyle(color: Colors.black),
                    leading: IconButton(
                      onPressed: () {
                        ProdData.RemoveItems(ModelData);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.keyboard_backspace_rounded),
                      color: Colors.white,
                    ),
                    title: Text(
                      'Product Details',
                      style: TextStyle(color: Colors.white),
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          ModelData.images.toString(),
                          fit: BoxFit.fill,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ModelData.brand.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '⭐${ModelData.ratings.toString()}'),
                                        Text(
                                          ModelData.price.toString(),
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              width: 20,
                            ),
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Image.network(
                                            ModelData.images.toString()),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Image.network(
                                            ModelData.images.toString()),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Image.network(
                                            ModelData.images.toString()),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Image.network(
                                            ModelData.images.toString()),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Card(
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ModelData.description.toString(),
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                    child: Card(
                      child: Container(
                        height: 320,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Colors',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(
                                    ModelData.color.toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red),
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                endIndent: 10,
                                height: 20,
                                indent: 1,
                                thickness: 0.2,
                              ),
                              Text(
                                'Stock Quantity',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 10),
                                child: Text(
                                    '${ModelData.stockQuantity.toString()} Pieces Available'),
                              ),
                              Divider(
                                color: Colors.black,
                                endIndent: 10,
                                height: 20,
                                indent: 1,
                                thickness: 0.2,
                              ),
                              Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      ProdData.CounterDec(ModelData);
                                      Text(ProdData.counter.toString());
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Text(
                                      ProdData.counter.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ProdData.CounterInc(ModelData);
                                      print(ProdData.counter.toString());
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      ProdData.CounterStat(ModelData);
                                    },
                                    child: Text('Reset'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 10,
                    ),
                  ),
                ],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.purple.withOpacity(0.6),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            items: [
              BottomNavigationBarItem(
                  icon: GestureDetector(onTap: () {}, child: Icon(Icons.home)),
                  key: GlobalKey(debugLabel: 'Home'),
                  label: 'home',
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(),
                          ),
                        );
                      },
                      child: Icon(Icons.person)),
                  label: 'Profile',
                  backgroundColor: Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
