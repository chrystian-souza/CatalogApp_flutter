import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/request_http.dart';
import 'package:flutter_application_1/views/detail_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TestView(title: "Detalhes do Produto", productDetails: snapshot.data[index],),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 10,
                      color: Color.fromARGB(255, 214, 230, 232),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 400,
                              height: 400,
                              child: Image.network(
                                snapshot.data[index]['images'][0],
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '${snapshot.data[index]['title']}',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold, 
                                  color: const Color.fromARGB(255, 10, 10, 10), 
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'R\$ ${snapshot.data[index]['price']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 10, 10, 10), 
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
