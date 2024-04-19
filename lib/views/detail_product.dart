import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  final String title;
  final Map<String, dynamic> productDetails;

  TestView({required this.title, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(16),
          child: Card(
            color: Color.fromARGB(255, 214, 230, 232),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black, width: 1),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Center(
                        child: Image.network(
                          productDetails['thumbnail'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título: ${productDetails['title']}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Descrição: ${productDetails['description']}',
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Preço: R\$ ${productDetails['price']}',
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Porcentual de desconto: R\$ ${productDetails['discountPercentage']}'
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Avaliação: R\$ ${productDetails['rating']}'
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Estoque: R\$ ${productDetails['stock']}'
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Marca: R\$ ${productDetails['brand']}'
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Categoria: R\$ ${productDetails['category']}'
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Voltar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
