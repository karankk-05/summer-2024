
import 'package:flutter/material.dart';
import 'email_details.dart';
import 'Model.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, cart, child) {
                  if (cart.cart.isEmpty) {
                    return Center(
                      child: Text('You have no starred emails'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: cart.cart.length,
                      itemBuilder: (context, index) {
                        final product = cart.cart[index];
                        return CartItem(
                          product: product,
                          
                        );
                      },
                    );
                  }
                },
              ),
            ),
            
          ],
        ),
        
            
          
        
       
      ),
    );
  }
}





class CartItem extends StatefulWidget {
  final Product product;

  CartItem({
    required this.product,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isHovered = false; 

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmailDetailsPage(
              sender: '${widget.product.sender}',
              timestamp: '${widget.product.timestamp}',
              subject: '${widget.product.subject}',
              attachments:'${widget.product.attachmentList}',
              
            ),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Card(
          margin: EdgeInsets.all(8.0),
          color: isHovered ? Colors.grey[200] : null, 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       '${widget.product.sender}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3), 
                      Text(
                        '${widget.product.subject}',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), 
                Column(
                  children: [
                    Text(
                      '${widget.product.timestamp}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
