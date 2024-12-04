import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/entity/shoppingcart.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_shop.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/icon_app_bar.dart';

class MyShoppingCart extends StatefulWidget {
  const MyShoppingCart({super.key});

  @override
  State<MyShoppingCart> createState() => _MyShoppingCartState();
}

class _MyShoppingCartState extends State<MyShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.grey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => MyShop()),
              );
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: color_main,
            )),
        title: Row(
          children: [
            const Text(
              "Giỏ hàng",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text("(${cart.getQuantity()})"),
          ],
        ),
        actions: [IconAppBar(icon: Icons.message), const SizedBox(width: 10)],
      ),
      body: Column(
        children: [
          cart.items.isNotEmpty ? listItemInCart() : myEmptyCart(),
          myBottom(),
        ],
      ),
    );
  }

  Expanded myEmptyCart() => const Expanded(
          child: Center(
              child: Text(
        "GIỎ HÀNG TRỐNG",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )));

  Widget listItemInCart() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            return myItem(cart.items[index]);
          },
        ),
      ),
    );
  }

  Widget myItem(ItemInCart iic) {
    return Card(
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: iic.isSelected,
              onChanged: (bool? value) {
                setState(() {
                  iic.isSelected = value ?? false;
                });
              },
              activeColor: color_main,
              checkColor: Colors.white,
            ),
            ClipRRect(
              child: Image.network(
                iic.image,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              iic.title,
              style: const TextStyle(
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${iic.price}",
                  style: TextStyle(
                      fontSize: 14,
                      color: color_main,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            cart.removeItem(iic);
                          });
                        },
                        icon: const Icon(Icons.remove)),
                    Text("${iic.quantity}"),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            cart.addItemInCart(iic);
                          });
                        },
                        icon: const Icon(Icons.add)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget myBottom() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: color_main)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Tổng thanh toán \$${cart.getTotal()}"),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: color_main,
                foregroundColor: Colors.white,
              ),
              child: Text(
                "Mua hàng (${cart.getSelectedItemCount()})",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
