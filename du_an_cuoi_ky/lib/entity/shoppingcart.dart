import 'package:du_an_cuoi_ky/entity/product.dart';

class ItemInCart extends Product {
  late int quantity;
  late bool isSelected;

  // Constructor
  ItemInCart(
      {required int id,
      required String title,
      required double price,
      required String description,
      required String category,
      required String image,
      required Rating rating,
      required this.quantity,
      this.isSelected = false})
      : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  // Factory method để chuyển từ JSON
  factory ItemInCart.fromJson(Map<String, dynamic> json) {
    return ItemInCart(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
      quantity: json['quantity'],
    );
  }

  // Phương thức chuyển đổi sang JSON (nếu cần lưu trữ hoặc gửi dữ liệu)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
      'quantity': quantity,
    };
  }

  // Cập nhật số lượng sản phẩm trong giỏ
  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
  }

  // Tính tổng giá trị của sản phẩm trong giỏ
  double getTotalPrice() {
    return price * quantity;
  }
}

class Cart {
  List<ItemInCart> items = [];

  Cart();

  // Thêm sản phẩm vào giỏ hàng
  void add(Product product, {int quantity = 1}) {
    var existingItem = items.firstWhere(
      (item) => item.id == product.id,
      orElse: () => ItemInCart(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        category: product.category,
        image: product.image,
        rating: product.rating,
        quantity: 0,
      ),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity += quantity;
    } else {
      items.add(ItemInCart(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        category: product.category,
        image: product.image,
        rating: product.rating,
        quantity: quantity,
      ));
    }
  }

  // Xoá một mục khỏi giỏ hàng
  void removeItem(ItemInCart item) {
    if (item.quantity > 1) {
      item.quantity--; // Giảm số lượng
    } else {
      items.remove(item);
    }
  }

  // Thêm một mục vào giỏ hàng
  void addItemInCart(ItemInCart item) {
    item.quantity++; // Tăng số lượng
  }

  // Xoá toàn bộ sản phẩm khỏi giỏ hàng
  void delete(Product product) {
    items.removeWhere((item) => item.id == product.id);
  }

  // Tính tổng tiền phải trả
  double getTotal() {
    double total =
        items.fold(0, (total, item) => total + (item.price * item.quantity));
    return double.parse(total.toStringAsFixed(2));
  }

  // Tính tổng số lượng sản phẩm trong giỏ
  int getQuantity() {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  //Đếm số lượng mặt hàng được chọn
  int getSelectedItemCount() {
    return cart.items.where((item) => item.isSelected).length;
  }
}

var cart = Cart();
