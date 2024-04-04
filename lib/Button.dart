// Button.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model.dart';

class PressableElevatedButton extends StatelessWidget {
 final String sender;
  final String timestamp;
  final String subject;
  final String attachment;

  PressableElevatedButton(
      { required this.sender,
    required this.timestamp,
    required this.subject,
    required this.attachment,
  });

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        content: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    bool isInCart = cart.isProductInCart(sender);
    IconData icon = isInCart
        ? Icons.star
        : Icons.star_outline;
    
    Color buttonColor = isInCart
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.primary;

    return IconButton(
      onPressed: () {
        if (isInCart) {
          Product existingProduct = cart.cart.firstWhere(
            (product) => product.sender == sender,
          );
          cart.removeFromCart(existingProduct);
          _showSnackBar(context, 'Removed from Starred');
        } else {
          cart.addToCart(Product(
              
              sender:sender,
              timestamp: timestamp,
              subject: subject,
              attachmentList: attachment
              ));
          _showSnackBar(context, 'Added to Starred');
        }
      },
      
      
      icon: Icon(
        icon,
        color: buttonColor,
      ),
      
        
      );
  
  }
}
