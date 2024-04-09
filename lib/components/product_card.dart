import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductCard({
    required this.product,
    required ValueKey key,
  });

  List<Map<String, dynamic>> get ingredients {
    return List<Map<String, dynamic>>.from(product['ingredients'].map((ing) {
      return {
        'name': ing,
        'allergic': isUserAllergicTo(ing),
      };
    }));
  }

  int get allergicIngredientsCount {
    return ingredients.where((ing) => ing['allergic']).length;
  }

  bool isUserAllergicTo(String ingredient) {
    // Implement your allergic check logic here
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Color(0xFF424242),
            width: 1.0,
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['image'],
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    product['description'],
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  if (allergicIngredientsCount > 0)
                    Container(
                      color: Colors.amberAccent,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Warning! This product contains $allergicIngredientsCount ingredients that you are allergic to.',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  SizedBox(height: 8.0),
                  Row(
                    children: ingredients
                        .map((ing) => Container(
                              margin: EdgeInsets.only(right: 8.0),
                              child: Chip(
                                label: Text(
                                  ing['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor:
                                    ing['allergic'] ? Colors.red : Colors.green,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
