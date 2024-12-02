import 'package:du_an_cuoi_ky/entity/product.dart';
import 'package:du_an_cuoi_ky/entity/shoppingcart.dart';
import 'package:flutter/material.dart';
import 'package:du_an_cuoi_ky/constant.dart';

class ProductsGridview extends StatefulWidget {
  final void Function() onItemAdded; // Hàm callback để thông báo
  final List<Product> products; // Danh sách sản phẩm nhận từ MainShopPage

  ProductsGridview(
      {required this.onItemAdded, required this.products, Key? key})
      : super(key: key);

  @override
  State<ProductsGridview> createState() => _ProductsGridviewState();
}

class _ProductsGridviewState extends State<ProductsGridview> {
  void addToCart(Product product) {
    setState(() {
      cart.add(product); // Sử dụng phương thức add từ lớp Cart
    });

    widget.onItemAdded(); // Gọi hàm callback để thông báo
  }

  @override
  Widget build(BuildContext context) {
    return MyGridview(widget.products, context);
  }

  GridView MyGridview(List<Product> lst, BuildContext context) {
    return GridView.builder(
      shrinkWrap:
          true, // Giúp GridView không chiếm toàn bộ không gian của ListView
      physics:
          NeverScrollableScrollPhysics(), // Ngừng cuộn của GridView để ListView cuộn mượt mà
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: lst.length,
      itemBuilder: (context, index) {
        return MyItem(lst[index], context);
      },
    );
  }

  Widget MyItem(Product p, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Center(
                child: ClipRRect(
                  child: Image.network(
                    p.image,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Text(
                p.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${p.price} \$",
                    style: TextStyle(
                      color: color_main,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      addToCart(p); // Thêm sản phẩm vào giỏ hàng
                    },
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: color_main,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 12,
                  ),
                  Text(
                    " ${p.rating.rate} (${p.rating.count})",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
