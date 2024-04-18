// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last
import 'package:demoapp_15_04/ViewModel/viewmodel3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel3>(
      builder: (context, ProfPage, child) => SizedBox(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: Text('Profile Page'),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: Provider.of<ViewModel3>(context).fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('error:${snapshot.error}');
              } else {
                return ListView.builder(
                  itemCount: ProfPage.ProductData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ModelClass3 = ProfPage.ProductData[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.grey.withOpacity(0.4),
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 40),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.network(
                                      ModelClass3.icon.toString(),
                                    ),
                                  ),
                                ),
                                Text(ModelClass3.home.toString()),
                              ],
                            ),
                          ),
                          elevation: 15,
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
