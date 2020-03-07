import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/datas/product_data.dart';

class CartProduct {
  String cid; //id do cart
  String category;
  String pid; //id do produto

  int quantity;
  String sizes;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    category = document.data['category'];
    pid = document.data['pid'];
    quantity = document.data['quantity'];
    sizes = document.data['sizes'];
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'pid': pid,
      'quantity': quantity,
      'sizes': sizes,
      'product': productData.toResumedMap(),
    };
  }
}
