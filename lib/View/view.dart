// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:demoapp_15_04/View/view2.dart';
import 'package:demoapp_15_04/ViewModel/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (context, VMData, child) => SizedBox(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Products',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ],
          ),
          body: FutureBuilder(
            future: Provider.of<ViewModel>(context).fetchDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('error:${snapshot.error}');
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: VMData.DataAdd.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ModelClass = VMData.DataAdd[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          VMData.DataItems(ModelClass);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 190,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.3)),
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                height: 190,
                                width: double.infinity,
                                child: Image.network(
                                  ModelClass.images.toString(),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(1.0),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  '⭐${ModelClass.ratings.toString()}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 30,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ModelClass.brand.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          ModelClass.price.toString(),
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
//add positioned in this
