import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/features/user_auth/entity/shoppingcart.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Thêm sản phẩm vào giỏ hàng
  Future<void> addToCart(String userId, ItemInCart item) async {
    final cartCollection =
        _firestore.collection('shopping_cart').doc(userId).collection('items');

    await cartCollection.doc(item.id.toString()).set({
      'id': item.id,
      'title': item.title,
      'price': item.price,
      'description': item.description,
      'category': item.category,
      'image': item.image,
      'rating': item.rating.toJson(),
      'quantity': item.quantity,
      'isSelected': item.isSelected,
    }, SetOptions(merge: true));
  }

  // Cập nhật số lượng sản phẩm trong giỏ
  Future<void> updateItemQuantity(
      String userId, int itemId, int quantity) async {
    final itemDoc = _firestore
        .collection('shopping_cart')
        .doc(userId)
        .collection('items')
        .doc(itemId.toString());

    await itemDoc.update({'quantity': quantity});
  }

  // Xoá sản phẩm khỏi giỏ
  Future<void> removeFromCart(String userId, int itemId) async {
    final itemDoc = _firestore
        .collection('shopping_cart')
        .doc(userId)
        .collection('items')
        .doc(itemId.toString());

    await itemDoc.delete();
  }

  // Xoá toàn bộ giỏ hàng
  Future<void> clearCart(String userId) async {
    final cartCollection =
        _firestore.collection('shopping_cart').doc(userId).collection('items');
    final snapshots = await cartCollection.get();

    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  // Lấy toàn bộ sản phẩm trong giỏ
  Future<List<ItemInCart>> getCartItems(String userId) async {
    final cartCollection =
        _firestore.collection('shopping_cart').doc(userId).collection('items');
    final querySnapshot = await cartCollection.get();

    return querySnapshot.docs.map((doc) {
      return ItemInCart.fromJson(doc.data());
    }).toList();
  }
}
